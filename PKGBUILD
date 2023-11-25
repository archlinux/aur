# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=kdiagram
pkgname=${_name}5
pkgver=2.8.0
pkgrel=1
pkgdesc='Powerful libraries for creating business diagrams'
arch=(x86_64)
url='https://www.kde.org/'
license=(GPL2)
depends=(qt5-svg)
makedepends=(extra-cmake-modules qt5-tools)
conflicts=('kdiagram<2.8.0-2')
replaces=('kdiagram<2.8.0-2')
source=(https://download.kde.org/stable/$_name/$pkgver/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('579dad3bd1ea44b5a20c0f133ebf47622e38960f9c7c8b3a316be30a369f431f'
            'SKIP')
validpgpkeys=(42A60D06F449E895F40F09C01638B8A616108B8A) # Dag Andersen <danders@get2net.dk>

build() {
  cmake -B build -S $_name-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
