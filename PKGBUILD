# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=bzrtp
pkgver=5.3.5
pkgrel=1
pkgdesc='Open source implementation of ZRTP keys exchange protocol'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL2)
depends=(libxml2 bctoolbox sqlite)
makedepends=(bcunit cmake)
source=(https://gitlab.linphone.org/BC/public/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('9d45f05dfd6e3f5b95fad216aaa5cc20d4f6c7f4b133fb8c3b825485e437c7f2')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
