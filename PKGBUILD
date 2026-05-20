# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=openair
_pkgver=3.1.0
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
  r-readr
  r-rlang
  r-scales
  r-tidyr
)
optdepends=(
  r-geomtextpath
  r-knitr
  r-legendry
  r-quantreg
  r-rmarkdown
  r-rnaturalearth
  r-sf
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('34870e5594e1000f4a3b9b13ae3c9192')
b2sums=('313f79debb9bf2a64caefd10d48cc913614dc4c8a9357232574288d0f8bd96c082e953950a3cde8eed7cbfedcbfe3c6906237258e729137d257df7431da8e9a4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
