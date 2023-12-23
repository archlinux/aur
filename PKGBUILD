# Maintainer: Michael Straube <michael.straubej@gmail.com>

pkgname=enyo-launcher
pkgver=2.0.6
pkgrel=1
pkgdesc="Frontend for Doom engines"
arch=(x86_64)
url="https://gitlab.com/sdcofer70/enyo-launcher"
license=(GPL3)
depends=(gcc-libs glibc qt5-base)
makedepends=(cmake)
source=("https://gitlab.com/sdcofer70/enyo-launcher/-/archive/$pkgver/enyo-launcher-$pkgver.tar.bz2")
sha512sums=('cb70e495a1ed31726725a18dfb931de133bf79c9b4105ca3692acc8e52be7db3610ae6f5b8fe40318a1704706386a1b2daabc3d41bbe357f8209c6b67dde88ff')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
