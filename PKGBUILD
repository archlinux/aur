# Maintainer: "Sergey Malkin <adresatt@gmail.com>"
pkgname=python-item_synchronizer
_pkgname=item_synchronizer
pkgver=1.1.4
pkgrel=1
pkgdesc="This library aims to offer an abstract and versatile way to create, update and/or delete items to keep two "sources" in sync."
url="https://github.com/bergercookie/item_synchronizer"
arch=("i686" "x86_64")
license=("MIT")
depends=("python")
makedepends=("python-build" "python-installer")
source=("https://github.com/bergercookie/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("3192d2f48ecdbc1d507d29000754b136e0b71e1652e6c9b4b4d4c623468e4a11")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
