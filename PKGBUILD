# Maintainer: Michael Straube <michael.straubej@gmail.com>

pkgname=enyo-launcher
pkgver=2.0.5
pkgrel=1
pkgdesc="Frontend for Doom engines"
arch=(x86_64)
url="https://gitlab.com/sdcofer70/enyo-launcher"
license=(GPL3)
depends=(qt5-base)
makedepends=(cmake)
source=("https://gitlab.com/sdcofer70/enyo-launcher/-/archive/$pkgver/enyo-launcher-$pkgver.tar.bz2")
sha512sums=('fb86ed4c8001d279cd728e5d6590a6a32ebce7e1b94c0076a77a313dc10afc0c1179fda36f8b99b591b50e63b4d2b7eb4776ce2c87058c1007c49d43a53f6ecd')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
