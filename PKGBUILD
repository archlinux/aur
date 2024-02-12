# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=PCICt
_pkgver=0.5-4.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Implementation of POSIXct Work-Alike for 365 and 360 Day Calendars"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-runit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7397539d6d582bde58d98cd050a2c159')
b2sums=('81213ed6d5cc043174f123f5282caa79a0971fe2ec3bb72c1eab72ad8070e74bedf6fc3291522ee6d951b9cb871140f78eaa6460dadc9e3e90b36ec8090f800b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
