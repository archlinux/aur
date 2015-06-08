# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kcmsystemd-kde4
pkgver=0.7.0
pkgrel=1
pkgdesc="Systemd control module for KDE4"
arch=('i686' 'x86_64')
url='https://github.com/rthomsen/kcmsystemd'
license=('GPL')
depends=('kdebase-workspace' 'boost-libs')
makedepends=('cmake' 'automoc4' 'boost')
source=("https://github.com/rthomsen/kcmsystemd/archive/$pkgver.tar.gz")
md5sums=('6506596175e31e24d67f042ac450c2d6')

build() {
  cd kcmsystemd-$pkgver
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd kcmsystemd-$pkgver/build
  make DESTDIR=$pkgdir install
}
