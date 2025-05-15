# Maintainer: Em Zhan <zqianem@gmail.com>

pkgname=nceplibs-ip
_pkgname=NCEPLIBS-ip
pkgver=5.4.0
pkgrel=1
pkgdesc="Fortran 90 subprograms to be used for interpolating between nearly all grids used at NCEP"
arch=('x86_64')
url="https://github.com/NOAA-EMC/NCEPLIBS-ip"
license=('LGPL-3.0-only')
depends=('lapack')
makedepends=('gcc-fortran' 'cmake')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/NOAA-EMC/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('918b2cc425d5f1fa7378346cad2d16ad68b03b575adeb40b8b37a7dc3e876041')

build() {
  cmake -B build -S "$srcdir/$_pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="/usr"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
