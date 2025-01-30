# Maintainer: "Gustav Åkerstrom <gustavakerstrom@gmail.com>"
# Contributor: "Sergey Malkin <adresatt@gmail.com>"

pkgname=python-item_synchronizer
_pkgname=item_synchronizer
pkgver=1.1.5
pkgrel=1
pkgdesc="This library aims to offer an abstract and versatile way to create, update and/or delete items to keep two "sources" in sync."
url="https://github.com/bergercookie/item_synchronizer"
arch=("i686" "x86_64")
license=("MIT")
depends=("python")
makedepends=("python-build" "python-installer")
source=("https://github.com/bergercookie/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a65a26e22b451c6f345bfa8dffb3cef41265ebb26e49f65fc4274a7df4f7df56')


build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
