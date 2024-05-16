# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=datamods
_pkgver=1.5.1
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
  r-ggplot2
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-testthat
  r-validate
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('56f8d224ea953f90bb4b2e003e161098')
b2sums=('c134e4d275a701e2605cbc1e389251d6fe530858ff105ef9c14f49f26c41dc0bff315b5598df7e9d0d1674d910866745936808c75323e5767cc6c744a4977f13')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
