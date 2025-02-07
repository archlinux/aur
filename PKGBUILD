# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-vllm-bin
_pkgname=vllm
pkgver=0.7.2
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
  python-cloudpickle
  python-safetensors
  python-tqdm
  python-requests
  python-transformers
  python-tokenizers
  python-protobuf
  python-fastapi
  python-aiohttp
  python-pydantic
  python-filelock
  python-pyzmq
  python-importlib-metadata
  python-yaml
  python-six
  python-gguf
  python-jinja
  python-pytorch
)
optdepends=(
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
  python-setuptools
)
source=("https://github.com/vllm-project/vllm/releases/download/v${pkgver}/vllm-${pkgver}+cu118-cp38-abi3-manylinux1_x86_64.whl")
noextract=("vllm-${pkgver}+cu118-cp38-abi3-manylinux1_x86_64.whl")
sha256sums=('844d467ced94ba6b45a1627386f898da5b54b1fa9f8fd8894998c812696216f3')

package() {
  python -m installer --destdir="${pkgdir}" vllm-${pkgver}+cu118-cp38-abi3-manylinux1_x86_64.whl
}
# vim:set ts=2 sw=2 et:
