FROM ubuntu:latest

# Install manually all the missing libraries
RUN apt-get update
RUN apt-get install g++ python3.10 python3-dev python3-pip git -y
RUN #apt-get install -y python3.10 python3-pip

# Clear apt lists
RUN #rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip
RUN mkdir -p "/libs/jax"
RUN git clone https://github.com/google/jax.git /libs/jax
RUN pip install numpy wheel
RUN python3 /libs/jax/build/build.py
RUN pip install libs/jax/dist/*.whl
RUN pip install libs/jax
COPY . .

# Install Poetry
RUN #pip install --upgrade pip

RUN #pip install --upgrade "jax[cuda]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html
RUN #pip install https://storage.googleapis.com/jax-releases/nocuda/jaxlib-0.4.4-cp310-cp310-manylinux2014_x86_64.whl
RUN #pip install --upgrade jaxlib
RUN #pip install --upgrade "jax[cpu]"
RUN #pip install "jaxlib==0.1.74"
RUN #pip install git+https://github.com/deepmind/mctx.git
RUN #pip install -r requirements.txt


# Run the web service on container startup.
#CMD python3 basic_tree_search.py -c config.json -o basic_tree_search -s 0
