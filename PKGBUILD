# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=compareGroups
_pkgver=4.7.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Descriptive Analysis by Groups"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-chron
  r-flextable
  r-hardyweinberg
  r-kableextra
  r-knitr
  r-officer
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
md5sums=('e9dbc5905e2f1d7bfb7bb5fe372d4e7a')
sha256sums=('a83f3e4cd8e83c24f8e867cbbca9f1fbeea611cbb77af31bab6506008772779b')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
