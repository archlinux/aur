# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=simsu
pkgver=1.3.9
pkgrel=1
pkgdesc='A basic Sudoku game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('b5df8994ff7bc35e775c466c8214e4362d1f720757383c9cd412693fcb6f143b')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
