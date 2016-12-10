# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=focuswriter
pkgver=1.6.2
pkgrel=2
pkgdesc='A simple fullscreen word processor'
arch=('i686' 'x86_64')
url="http://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'hunspell')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('ac77139b4c9b70d26643e5707a9db9003586a6633779dec20a5c1353602b2655')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
