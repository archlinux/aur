# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=tetzle
pkgver=2.1.0
pkgrel=3
pkgdesc='A tetromino jigsaw puzzle game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
optdepends=('jhead: auto-orient images')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('d31fcdbdaf060d0a4a6b239dd260332301f8a950d173fe742afeab44c0ffa313')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make INSTALL_ROOT="$pkgdir/" install
}
