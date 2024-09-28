# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=genio
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genetics Input/Output Functions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-dplyr
  r-rcpp
  r-readr
  r-tibble
)
optdepends=(
  r-bedmatrix
  r-knitr
  r-lobstr
  r-rmarkdown
  r-snpstats
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e571367e715093bae50df70fe3abe99d')
b2sums=('124fa4a62d96bc8155892a4ce997bda30ef291dedc9d8ac69732bafd7dabb41743eba56b6ed1ffa2062a571ff28ab075e64f36928e3c969a4706e02657c87729')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
