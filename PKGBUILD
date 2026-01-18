# Maintainer: dringsim <dringsim@qq.com>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=relational
pkgver=3.4
pkgrel=1
pkgdesc="Educational tool for relational algebra"
arch=('any')
url="https://ltworf.codeberg.page/relational/"
license=('GPL-3.0-or-later')
depends=('python-pyqt6' 'python-termcolor' 'python-typedload')
makedepends=('python-setuptools')
checkdepends=('mypy')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/ltworf/relational/releases/download/$pkgver/$pkgname_$pkgver.orig.tar.gz")
sha256sums=('46635613c82f18862283f4517009c55762a75ec40386618989c588f9dbba8556')

build() {
  cd "$pkgname"
  make
}

check() {
  cd "$pkgname"
  make test mypy
}

package() {
  make -C "$pkgname" DESTDIR="$pkgdir" install
}
