# Maintainer: "Gustav Åkerström <gustavakerstrom@gmail.com>"
# Contributor: "Sergey Malkin <adresatt@gmail.com>"

pkgname=python-bubop
_pkgname=bubop
pkgver=0.2.2
pkgrel=1
pkgdesc="Bergercookie's Useful Bits Of Python"
url="https://github.com/bergercookie/bubop"
arch=("i686" "x86_64")
license=("MIT")
depends=("python")
makedepends=("python-build" "python-installer")
source=("https://github.com/bergercookie/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3c4d2a50538a2f878fdaa87bc47f8a37ccb9d0a030d585f5095c3800ae2c1b42')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
