# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=compareGroups
_pkgver=4.10.4
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
  r-rmdformats
  r-rstatix
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
md5sums=('940e7e52912247a02a8b273f6c0238d4')
b2sums=('f08a19f4549c1e2a0ebcaf47dd7b84259b7c80153393b30ec66d1fd19fadacd52050868327b4a995af2cc2598d357aaae0dabcee7efe0e904cc2cf9243e4897a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
