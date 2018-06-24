# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=kapow
pkgver=1.5.7
pkgrel=1
pkgdesc='Punch clock to track time spent on projects'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('031d49ca9fe27591b0b6291bfcedbf7ac99938067b8a14812ddfecbbadf10caf')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
