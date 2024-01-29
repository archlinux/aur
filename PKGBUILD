# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=compareGroups
_pkgver=4.8.0
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
md5sums=('75fd7f131ad91fffd760b73ce7fdcd1a')
b2sums=('6129aa3828c0c8d5c809ebdfdaa30b917623d7f03ad22ac473aeace3e202e989deba7202a2380f4dc794dc71e70a10748604783b9550d3bd1cf90fe7086fcd30')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
