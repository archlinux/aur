# Maintainer: Em Zhan <zqianem@gmail.com>

pkgname=nceplibs-ip
_pkgname=NCEPLIBS-ip
pkgver=5.4.1
pkgrel=1
pkgdesc="Fortran 90 subprograms to be used for interpolating between nearly all grids used at NCEP"
arch=('x86_64')
url="https://github.com/NOAA-EMC/NCEPLIBS-ip"
license=('LGPL-3.0-only')
depends=('lapack')
makedepends=('gcc-fortran' 'cmake')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/NOAA-EMC/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c80eab0a28a081a90051257490e4fc801a90f66cb9e2435119379649b4289577')

build() {
  cmake -B build -S "$srcdir/$_pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="/usr"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
