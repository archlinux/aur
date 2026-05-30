# Maintainer: Austin Cross <austincross@gmail.com>

pkgname=iplib
pkgver=5.4.1
pkgrel=1
pkgdesc="Grid interpolation library"
arch=('x86_64')
url="https://github.com/NOAA-EMC/NCEPLIBS-ip"
license=('LGPL-3.0-only')
depends=()
makedepends=('gcc-fortran' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NOAA-EMC/NCEPLIBS-ip/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c80eab0a28a081a90051257490e4fc801a90f66cb9e2435119379649b4289577')

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
