# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=openair
_pkgver=3.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for the Analysis of Air Pollution Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-dplyr
  r-ggplot2
  r-lubridate
  r-patchwork
  r-purrr
  r-rcpp
  r-rlang
  r-scales
  r-tidyr
)
optdepends=(
  r-geomtextpath
  r-knitr
  r-legendry
  r-quantreg
  r-rcolorbrewer
  r-readr
  r-rmarkdown
  r-rnaturalearth
  r-rnaturalearthdata
  r-sf
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6909cbf1275c2f9c0e2c46754fb9323e')
b2sums=('cb7c48bf761cb889e0103475506d435cfc4e14b44b3da7e5ddf1b8a084c059491467d353a1d067a0cda07f015ad11bdd655f19c07420d27a1f96db1e2c92b712')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
