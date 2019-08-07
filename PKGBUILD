# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=simsu
pkgver=1.3.8
pkgrel=1
pkgdesc='A basic Sudoku game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('79b35bef30b6629574cb563d60291b4dc2cd41f52dc48acde53dcb874656b6a6')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
