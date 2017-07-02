# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=peg-e
pkgver=1.2.2
pkgrel=3
pkgdesc='Peg elimination game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('eec570e318fbffa225d70ad5277cd1027606193f426e26f81a0ec20cb722fcd5')

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
