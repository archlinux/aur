# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=openair
_pkgver=3.0.0
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
  r-rnaturalearthdata
  r-sf
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d4bb7b146892c378edc18fda54dd2317')
b2sums=('1e8a58b8547c7f2fda3951808ae4e0ee41b3c008c94d47d4dd888404dceb6a0ae5e7c9915000409886f1ea821df6eff78e75d982af62d82b12c3a6cca950eff0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
