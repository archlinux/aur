# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=bzrtp
pkgver=5.2.73
pkgrel=1
pkgdesc='Open source implementation of ZRTP keys exchange protocol'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL2)
depends=(libxml2 bctoolbox sqlite)
makedepends=(bcunit cmake)
source=(https://gitlab.linphone.org/BC/public/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('f2d2eac2993dbb4247544e1236eef7631b87bf6c4631c8a37402e86132511def')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STATIC=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
