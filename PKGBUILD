# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=datamods
_pkgver=1.5.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Modules to Import and Manipulate Data in 'Shiny'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-bslib
  r-classint
  r-data.table
  r-htmltools
  r-phosphoricons
  r-reactable
  r-readxl
  r-rio
  r-rlang
  r-shiny
  r-shinybusy
  r-shinywidgets
  r-tibble
  r-toastui
  r-writexl
)
optdepends=(
  r-ggplot2
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-testthat
  r-validate
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6f6ce0f1996967e1b3b1fd23bb0de0a5')
b2sums=('ce8135b35d5f08707a5fbaacc94121dd0fda258563b8e4b6487adfcd728429b555d1eb40c24400bfde1b522658e172f57fe781b9637085686c407da408423d4f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
