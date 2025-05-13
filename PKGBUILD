# Maintainer: Em Zhan <zqianem@gmail.com>

pkgname=nceplibs-g2c
_pkgname=NCEPLIBS-g2c
pkgver=2.2.0
pkgrel=1
pkgdesc="C decoder/encoder routines for GRIB edition 2"
arch=('x86_64')
url="https://github.com/NOAA-EMC/NCEPLIBS-g2c"
license=('LGPL-3.0-only')
depends=('jasper' 'libpng' 'zlib' 'openjpeg2' 'libaec')
makedepends=('cmake')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cf0ac8f75aed662ccc64f4c44fbe46a70307bc27cbe95417fdfb6caf75245457')
options=('staticlibs')

build() {
  cmake -B build -S "$srcdir/$_pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="/usr"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
