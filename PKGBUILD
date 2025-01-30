# Maintainer: Em Zhan <zqianem@gmail.com>

pkgname=nceplibs-ip
_pkgname=NCEPLIBS-ip
pkgver=5.2.0
pkgrel=1
pkgdesc="Fortran 90 subprograms to be used for interpolating between nearly all grids used at NCEP"
arch=('x86_64')
url="https://github.com/NOAA-EMC/NCEPLIBS-ip"
license=('LGPL-3.0-only')
depends=('lapack')
makedepends=('gcc-fortran' 'cmake')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/NOAA-EMC/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2f7b44abcf24e448855f57d107db55d3d58cbc271164ba083491d0c07a7ea3d0')

build() {
  cmake -B build -S "$srcdir/$_pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="/usr"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
