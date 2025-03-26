# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-vllm-bin
_pkgname=vllm
pkgver=0.8.2
pkgrel=5
pkgdesc="high-throughput and memory-efficient inference and serving engine for LLMs"
arch=('x86_64')
url='https://github.com/vllm-project/vllm'
provides=(python-vllm)
conflicts=(python-vllm)
license=(Apache-2.0)
depends=(
  python
  uvicorn
  python-starlette
  python-setuptools
  python-psutil
  python-sphinx
  python-fastapi
  python-boto3
  python-cachetools
  python-importlib-metadata
  python-opencv
  python-py-cpuinfo
  python-soundfile
  python-yaml
)
optdepends=(
  'cuda: use nvidia GPU'
  'cuda-tools: use nvidia GPU'
  'python-openai: required for openai protocols'
  'python-prometheus_client: Prometheus instrumentation library for Python applications'
  'prometheus-fastapi-instrumentator: Prometheus fastapi implementation'
  'python-pillow: required for image processing'
  'python-tiktonek: required for DBRX tokenizer'
  'python-lm-format-enforcer: required for JSON/REGEX llm output'
  'python-outlines: guided text generation'
  'python-lark: parsing toolkit'
  'python-xgrammar: flexible structured generation'
  'python-typing_extensions: typing hints'
  'python-partial-json-parser: parse partial JSON output'
  'python-msgspec: JSON/MessagePack library with validation'
  'python-mistral-common: mistral tools for opencv'
  'python-einops: required for QWen2-VL models'
  'python-compressed-tensors: required to load compressed tensor files'
  'python-depyf: required for debugging and profiling with complilation config'
  'python-torchaudio: required for image processor of minicpm-o-2.6'
  'python-torchvision: required for image processor of phi3v'
  'python-datasets: tools to benchmark scripts'
  'python-blake3: blake3 cryptographic hash functions'
)
makedepends=(
  python-installer
)
source=("https://github.com/vllm-project/vllm/releases/download/v${pkgver}/vllm-${pkgver}+cu121-cp38-abi3-manylinux1_x86_64.whl")
noextract=("vllm-${pkgver}+cu121-cp38-abi3-manylinux1_x86_64.whl")
sha256sums=('21098353071fc4f8b4f07d6acc9bfae841f658ce66b90f7f5dadb407c3b7026d')

package() {
  python -m installer --destdir="${pkgdir}" vllm-${pkgver}+cu121-cp38-abi3-manylinux1_x86_64.whl
}
# vim:set ts=2 sw=2 et:
