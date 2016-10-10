# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=kapow
pkgver=1.5.1
pkgrel=1
pkgdesc='Punch clock to track time spent on projects'
arch=('i686' 'x86_64')
url="http://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("http://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('12dbf9493b890509d818642bb1f17222bf5fb2658c90033d0184a1235e623ac3')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
