# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-vllm-bin
_pkgname=vllm
pkgver=0.10.0
pkgrel=2
pkgdesc="high-throughput and memory-efficient inference and serving engine for LLMs"
arch=('x86_64')
url='https://github.com/vllm-project/vllm'
provides=(python-vllm)
conflicts=(python-vllm)
license=(Apache-2.0)
depends=(
  python-sympy
  numactl
  python-pytorch
  python-transformers
  python-sphinx
  python-aiohttp
  python-cachetools
  python-uvloop
  python-fastapi
  uvicorn
  python-soundfile
  python-starlette
  python-tqdm
  python-boto3
  python-openai
  python-importlib-metadata
  python-torchvision
  python-pydantic
  python-psutil
  python-opencv
  python-py-cpuinfo
  python-msgspec
  python-pyzmq
  python-blake3
  python-cloudpickle
  python-triton python-huggingface-hub
  python-gguf
  python-prometheus-fastapi-instrumentator
  python-partial-json-parser
  python-watchfiles
  )

optdepends=(
  'cuda: use nvidia GPU'
  'cuda-tools: use nvidia GPU'
  'python-openai: required for openai protocols'
  'python-prometheus_client: Prometheus instrumentation library for Python applications'
  'python-pillow: required for image processing'
  'python-outlines: guided text generation'
  'python-lark: parsing toolkit'
  'python-typing_extensions: typing hints'
  'python-msgspec: JSON/MessagePack library with validation'
  'python-mistral-common: mistral tools for opencv'
  'python-einops: required for QWen2-VL models'
  'python-compressed-tensors: required to load compressed tensor files'
  'python-torchaudio: required for image processor of minicpm-o-2.6'
  'python-torchvision: required for image processor of phi3v'
  'python-datasets: tools to benchmark scripts'
#not in aur/upstream
  'python-tikoken: required for DBRX tokenizer'
  'python-depyf: required for debugging and profiling with complilation config'
  'python-lm-format-enforcer: required for JSON/REGEX llm output'
  'python-xgrammar: flexible structured generation'
)
makedepends=(
  python-installer
)
_cpy=38
_cuda=126
source=("https://github.com/vllm-project/vllm/releases/download/v${pkgver}/vllm-${pkgver}+cu${_cuda}-cp${_cpy}-abi3-manylinux1_x86_64.whl")
noextract=("vllm-${pkgver}+cu${_cuda}-cp${_cpy}-abi3-manylinux1_x86_64.whl")
sha256sums=('d3a8d58eee37f2475aedaf5b54403d9747da9ec273e802ad81b32b59ba81a87b')

package() {
  python -m installer --destdir="${pkgdir}" vllm-${pkgver}+cu${_cuda}-cp${_cpy}-abi3-manylinux1_x86_64.whl
}
# vim:set ts=2 sw=2 et:
