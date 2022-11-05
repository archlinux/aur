# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=bzrtp
pkgver=5.1.67
pkgrel=1
pkgdesc='Open source implementation of ZRTP keys exchange protocol'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL2)
depends=(libxml2 bctoolbox sqlite)
makedepends=(bcunit cmake)
source=(https://gitlab.linphone.org/BC/public/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('729ad666bdf5a64c20a063d60d40ebfb55821e785147a16dc5f7978511155b04')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STATIC=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
