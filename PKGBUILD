# Maintainer: Austin Cross <austincross@gmail.com>

pkgname=iplib
pkgver=5.1.0
pkgrel=1
pkgdesc="Grid interpolation library"
arch=('x86_64')
url="https://github.com/NOAA-EMC/NCEPLIBS-ip"
license=('LGPL-3.0-only')
depends=()
makedepends=('gcc-fortran' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NOAA-EMC/NCEPLIBS-ip/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5279f11f4c12db68ece74cec392b7a2a6b5166bc505877289f34cc3149779619')

build() {
  cmake -B build -S "NCEPLIBS-ip-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
