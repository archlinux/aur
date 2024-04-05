# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=datamods
_pkgver=1.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Modules to Import and Manipulate Data in 'Shiny'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
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
  r-bslib
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-testthat
  r-validate
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c673a9040c0ffeceeed8eb866e128c38')
b2sums=('75811b1625af099ff43decd9b9c96122b2f83cb89723407eb78d1c9503c1bdecfd0e87ddd507717612acb4fb9efbcc814efab8fc74fd10765733eab22adb2663')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
