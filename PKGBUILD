# Maintainer: richc <admin+aur@sys.corbet.ch>
#
# intel-llm — one install, fast local LLMs on Intel laptops:
#   * Arc GPU via official llama-cpp + ggml-sycl
#     (llama.cpp-sycl-bin was retired after PRQ#86548 — extra now ships the
#     SYCL backend natively, and AUR forbids duplicating official repos)
#   * NPU/GPU/CPU via OpenVINO GenAI (openvino-genai-bin)
# Ships one entry point (`intel-llm`) plus `intel-gpu` / `intel-npu` runners.

pkgname=intel-llm
pkgver=0.2.0
pkgrel=2
pkgdesc="One entry point for fast local LLMs on Intel laptops (Arc GPU via official llama-cpp + ggml-sycl, NPU via OpenVINO GenAI)"
arch=('any')
url='https://github.com/corbet-labs/intel-llm'
license=('MIT')
depends=(
  'llama-cpp'
  'ggml-sycl'
  'openvino-genai-bin'
  'python-huggingface-hub'
)
optdepends=(
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
