# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=connectagram
pkgver=1.2.10
pkgrel=1
pkgdesc='A word unscrambling game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('04dbe12f52e68a0fececad1bbab08e279d7fd2f438e126bfc6d047daf1a55b75')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
