# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=compareGroups
_pkgver=4.9.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Descriptive Analysis by Groups"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-chron
  r-flextable
  r-hardyweinberg
  r-kableextra
  r-knitr
  r-officer
  r-pmcmrplus
  r-rmarkdown
  r-writexl
)
optdepends=(
  r-dt
  r-haven
  r-readxl
  r-shiny
  r-shinybs
  r-shinydashboardplus
  r-shinyjqui
  r-shinyjs
  r-shinythemes
  r-shinywidgets
  r-tcltk2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('467b9a6d3322a11c7e8f8dc0f47d6038')
b2sums=('48cd93d095b137bca9e44a13502f2cfc58e8855337921e72f0cc42ff8252198f859431dd5acba1b72febc33a16aedd8d871deef803d3c1f9545a731e20299abd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
