# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bctoolbox
pkgver=5.1.71
pkgrel=1
pkgdesc='A library written in C that allows you to create and run audio and video streams'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL)
depends=(mbedtls bcunit)
makedepends=(cmake)
source=(https://gitlab.linphone.org/BC/public/bctoolbox/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('eedb21617b594b5997222f35e119875b9d30bba1b43f302ec6ecdd0d6a614497')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STATIC=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
