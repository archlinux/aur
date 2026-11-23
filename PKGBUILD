# Maintainer: Christos Longros <chris.longros@gmail.com>
_pkgname=ankiR
_pkgver=0.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Read and Analyze 'Anki' Flashcard Databases"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-rlang
  r-jsonlite
  r-dbi
  r-rsqlite
  r-tibble
  r-scales
)
optdepends=(
  r-shiny
  r-testthat
  r-knitr
  r-rmarkdown
  r-ggplot2
  r-withr
  r-dplyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f4349bc1a7ae403ed99ae1c34a69f0e8')
build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}
package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
