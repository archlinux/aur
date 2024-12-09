# Maintainer: Em Zhan <zqianem@gmail.com>

pkgname=nceplibs-g2c
_pkgname=NCEPLIBS-g2c
pkgver=2.0.0
pkgrel=1
pkgdesc="C decoder/encoder routines for GRIB edition 2"
arch=('x86_64')
url="https://github.com/NOAA-EMC/NCEPLIBS-g2c"
license=('LGPL-3.0-only')
depends=('jasper' 'libpng' 'zlib' 'openjpeg2' 'libaec')
makedepends=('cmake')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('39c23bf1219c60101548c8525e3a879c84119558f768081779d404a8caf4cec9')
options=('staticlibs')

build() {
  cmake -B build -S "$srcdir/$_pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="/usr"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
