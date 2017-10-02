# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=relational
pkgver=2.5
pkgrel=1
pkgdesc="Educational tool for relational algebra"
arch=('any')
url="http://ltworf.github.io/relational/"
license=('GPL3')
depends=('python-pyqt5' 'python-xtermcolor')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ltworf/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('0b509ed4ba8cda881006e4b439ea5b59acc164fd823486275857c8c4c64eafd3')

check() {
  cd "$pkgname-$pkgver"
  python driver.py
}

package() {
  make -j1 -C "$pkgname-$pkgver" DESTDIR=$pkgdir install
}
