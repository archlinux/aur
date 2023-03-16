# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=bzrtp
pkgver=5.2.32
pkgrel=1
pkgdesc='Open source implementation of ZRTP keys exchange protocol'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL2)
depends=(libxml2 bctoolbox sqlite)
makedepends=(bcunit cmake)
source=(https://gitlab.linphone.org/BC/public/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('5632a958678ccdd2f22b141d13b487fe483d3ee9dd06868f2ceb3cce3a6a10ae')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STATIC=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
