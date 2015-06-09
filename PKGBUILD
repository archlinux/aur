# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=connectagram
pkgver=1.2.1
pkgrel=1
pkgdesc='A word unscrambling game'
arch=('i686' 'x86_64')
url="http://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
install="$pkgname.install"
source=("http://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('0a559243a8d970bb79c6791214be879269fc073b5eaec6aa55fb60be82f140bb')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
