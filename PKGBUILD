# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=focuswriter
pkgver=1.6.16
pkgrel=1
pkgdesc='A simple fullscreen word processor'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'hunspell')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('d5243111aa06b1d95461460701028c80a6b83fe1fd2b59b53faa20d2d27659f1')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
