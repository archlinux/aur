# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=kapow
pkgver=1.5.3
pkgrel=1
pkgdesc='Punch clock to track time spent on projects'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('73953d980e248ccf74c8b94c62ee1dbeaa9843481ca87a8e6af7fe1c2eb8c712')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
