# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=simsu
pkgver=1.3.4
pkgrel=1
pkgdesc='A basic Sudoku game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('1dd01274796583e49520217c93b6ebeab1bd58703c158a92209ed0bdd87b26b0')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
