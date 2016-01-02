# Maintainer: Antonio Rojas < arojas @ archlinux.org >

pkgname=zanshin
pkgver=0.3.0
pkgrel=1
pkgdesc="To-do management application for KDE based on Akonadi"
arch=(i686 x86_64)
url="http://zanshin.kde.org"
license=(GPL)
install=$pkgname.install
depends=(kdepim4-runtime)
makedepends=(cmake automoc4 boost)
source=("http://files.kde.org/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('1a97ae0a827bd0d01a7c7a9c166f7c8b')

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../$pkgname-$pkgver \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release \
	-DKDE4_BUILD_TESTS=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
