# Maintainer: Noufal <noufalkakdlr@gmail.com>
pkgname=qrify
pkgver=0.1.0
pkgrel=1
pkgdesc="Interactive QR code generator CLI"
arch=('any')
url="https://github.com/noufalkdlr/qrcode-generator"
license=('MIT')
depends=('python' 'python-qrcode' 'python-typer' 'python-questionary' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/noufalkdlr/qrcode-generator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b33e537d9b393b5e5599d25fc95f15c84dadb9d7fedc51a6f6a626fd39dcd400')

build() {
  cd "qrcode-generator-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "qrcode-generator-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
