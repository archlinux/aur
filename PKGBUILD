# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=WRS2
_pkgver=1.1-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Collection of Robust Statistical Methods"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-plyr
  r-reshape
)
optdepends=(
  r-car
  r-colorspace
  r-ggally
  r-ggplot2
  r-knitr
  r-mediation
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1d680b11b9cdc32bfd9ea886b0754904')
b2sums=('3c24050f90afa84677d2755e46c478dab6c3319a376ad8bb2fdbebc568cf449adecdc0cb2974b9390f70a1a7e64aa55aed9a9dba12155e902f879f24988604cc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
