# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=simsu
pkgver=1.3.6
pkgrel=1
pkgdesc='A basic Sudoku game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('77a6ececec02787731f32ebdbc0a89fe5cecb4418519e86311c445814eb9ab1c')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
