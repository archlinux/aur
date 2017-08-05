# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=tetzle
pkgver=2.1.1
pkgrel=1
pkgdesc='A tetromino jigsaw puzzle game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
optdepends=('jhead: auto-orient images')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('2db3705806339efa810494f0bce6b1b3899fbffa3deee0401a25956929a54eb6')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
