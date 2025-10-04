# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-vllm-bin
_pkgname=vllm
pkgver=0.11.0
pkgrel=1
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
  python-triton 
  python-huggingface-hub
  python-gguf
  python-prometheus-fastapi-instrumentator
  python-partial-json-parser
  python-watchfiles
  python-diskcache
  python-pybase64
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
  'python-tiktoken: required for DBRX tokenizer'
#not in aur/upstream
  'python-depyf: required for debugging and profiling with complilation config'
  'python-lm-format-enforcer: required for JSON/REGEX llm output'
  'python-xgrammar: flexible structured generation'
)
makedepends=(
  python-installer
  zip
  unzip
)
options=(!strip)
_cpy=38
_cuda=129
_whl="vllm-${pkgver}+cu${_cuda}-cp${_cpy}-abi3-manylinux1_x86_64.whl"
source=(
  "https://github.com/vllm-project/vllm/releases/download/v${pkgver}/${_whl}"
)
noextract=("${_whl}")
sha256sums=('6dc56d15c8a0a560be7517b4ed60c9685e9f48e8a36df606f86a0bd99e3dfd22')
package() {
  python -m installer --destdir="${pkgdir}" "${_whl}"
}
# vim:set ts=2 sw=2 et:
