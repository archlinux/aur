# Maintainer: "Sergey Malkin <adresatt@gmail.com>"
pkgname=python-bubop
_pkgname=bubop
pkgver=0.1.10
pkgrel=1
pkgdesc="Bergercookie's Useful Bits Of Python"
url="https://github.com/bergercookie/bubop"
arch=("i686" "x86_64")
license=("MIT")
depends=("python")
makedepends=("python-build" "python-installer")
source=("https://github.com/bergercookie/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("ef77a8388e1580a2ff42975e5e9bbb94cddca0e27a09e38529d4d9b10360df08")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
