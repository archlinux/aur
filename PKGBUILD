# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bctoolbox
pkgver=5.1.67
pkgrel=1
pkgdesc='A library written in C that allows you to create and run audio and video streams'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL)
depends=(mbedtls bcunit)
makedepends=(cmake)
source=(https://gitlab.linphone.org/BC/public/bctoolbox/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('ead8045f0759fcb67559e1b1745288771f349bed03dde4af216ec45c93a09755')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STATIC=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
