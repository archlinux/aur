# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=focuswriter
pkgver=1.5.3
pkgrel=1
pkgdesc='A simple fullscreen word processor'
arch=('i686' 'x86_64')
url="http://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'hunspell')
install="$pkgname.install"
source=("http://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('1c48c72879a7b40cf7d97c28abf5cf713c063b7f83a1179093b1241f5797a8c4')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
