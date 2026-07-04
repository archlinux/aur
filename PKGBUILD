# Maintainer: richc <admin+aur@sys.corbet.ch>
#
# intel-llm — one install, fast local LLMs on Intel laptops:
#   * Arc GPU via llama.cpp SYCL   (llama.cpp-sycl-bin)
#   * NPU/GPU/CPU via OpenVINO GenAI (openvino-genai-bin)
# Ships one entry point (`intel-llm`) plus `intel-gpu` / `intel-npu` runners.

pkgname=intel-llm
pkgver=0.1.0
pkgrel=1
pkgdesc="One entry point for fast local LLMs on Intel laptops (Arc GPU via SYCL + NPU via OpenVINO GenAI)"
arch=('any')
url='https://github.com/julian-corbet/intel-llm'
license=('MIT')
depends=(
  'llama.cpp-sycl-bin'
  'openvino-genai-bin'
  'python-huggingface-hub'
)
optdepends=(
  'intel-oneapi-basekit: SYCL runtime for the Arc GPU path'
  'intel-npu-driver: Intel NPU (AI Boost) for the fast NPU path'
  'intel-llm-convert: convert your own HF models to NPU INT4 IR'
)
source=('intel-llm' 'intel-gpu' 'intel-npu')
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm755 "$srcdir/intel-llm" "$pkgdir/usr/bin/intel-llm"
  install -Dm755 "$srcdir/intel-gpu" "$pkgdir/usr/bin/intel-gpu"
  install -Dm755 "$srcdir/intel-npu" "$pkgdir/usr/bin/intel-npu"
}
