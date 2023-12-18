# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=bzrtp
pkgver=5.2.112
pkgrel=1
pkgdesc='Open source implementation of ZRTP keys exchange protocol'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL2)
depends=(libxml2 bctoolbox sqlite)
makedepends=(bcunit cmake)
source=(https://gitlab.linphone.org/BC/public/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('fe4f3e830fbff40051c0a91a195aaa776fcd257b1a2e5814f8d91b8ce0fcf49d')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STATIC=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
