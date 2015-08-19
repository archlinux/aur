# Maintainer: Antonio Rojas < arojas @ archlinux.org >

pkgname=zanshin
pkgver=0.2.2
pkgrel=1
pkgdesc="To-do management application for KDE based on Akonadi"
arch=(i686 x86_64)
url="http://zanshin.kde.org"
license=(GPL)
install=$pkgname.install
depends=(kdepim4-runtime)
makedepends=(cmake automoc4 boost)
source=("http://files.kde.org/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('94b2c142b7afcab0ee4fdb4e5000329c')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../$pkgname-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
