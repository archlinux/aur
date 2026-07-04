# Maintainer: richc <admin+aur@sys.corbet.ch>
#
# intel-llm-convert — convert HuggingFace models to NPU-ready OpenVINO INT4 IR.
#
# The conversion stack (optimum-intel + nncf + torch, needing transformers<5) is
# version-sensitive and clashes with the system's transformers, so it lives in an
# isolated uv-managed environment built on first use. This package itself is tiny;
# it only ships the wrapper + the pinned requirements. Optional — most users just
# run pre-converted models from HuggingFace with `intel-npu`.

pkgname=intel-llm-convert
pkgver=0.1.0
pkgrel=1
pkgdesc="Convert HuggingFace models to NPU-ready OpenVINO INT4 IR (isolated uv env)"
arch=('any')
url='https://github.com/julian-corbet/intel-llm'
license=('MIT')
depends=('uv')
optdepends=('intel-llm: run the converted models on the NPU with `intel-npu`')
source=('intel-llm-convert' 'requirements.txt')
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 "$srcdir/intel-llm-convert" "$pkgdir/usr/bin/intel-llm-convert"
  install -Dm644 "$srcdir/requirements.txt" "$pkgdir/usr/share/intel-llm-convert/requirements.txt"
}
