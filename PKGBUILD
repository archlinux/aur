# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=hexalate
pkgver=1.1.0
pkgrel=3
pkgdesc='A color matching game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('74a8f23b7164981dbe968daa004781646c9063f1e80b234b19166570da22349c')

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
