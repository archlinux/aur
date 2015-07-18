# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=focuswriter
pkgver=1.5.4.1
pkgrel=1
pkgdesc='A simple fullscreen word processor'
arch=('i686' 'x86_64')
url="http://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'hunspell')
install="$pkgname.install"
source=("http://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('867f1a58e61f9e7951d4dbd3a901c9651bababf6e57b84fbd081b36874098783')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
