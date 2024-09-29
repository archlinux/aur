# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=compareGroups
_pkgver=4.9.0
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
md5sums=('910f387dc0f8c1e1219e8bb3e0b1223e')
b2sums=('65603a732e8cd453a45aa362a65f3a1c5cfd323726ce7466ebd4d5f094c3aa07e0631f106a16e6b8b0fcff0b372ec47f0991992df2094b3a1e1dd8ff8bb8f6c2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
