# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=relational
pkgver=3.0
pkgrel=1
pkgdesc="Educational tool for relational algebra"
arch=('any')
url="http://ltworf.github.io/relational/"
license=('GPL3')
depends=('python-pyqt5' 'python-typedload' 'python-xtermcolor')
makedepends=('python-setuptools')
checkdepends=('mypy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ltworf/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('3b0242f24f512f388625f1766381d1e53b5ceec078764035498b268c828eb72e')

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  make test mypy
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
