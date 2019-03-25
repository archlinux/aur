# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=tetzle
pkgver=2.1.4
pkgrel=1
pkgdesc='A tetromino jigsaw puzzle game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('aa6a51d4862379c2cb00ce8162a31c6c1bf2c33f4377f0cb43536a920aa80562')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
