# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=datamods
_pkgver=1.5.3
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
md5sums=('e21c9e2b451c9890d3a5afaa2b6fe584')
b2sums=('bf18f81334b119ae0eefcf863e4e4d8c493dc17bb8b37b63631cc591a718ac33bfca198f853a30d0a550ef92831799ac9f303e20966009bfe5b67c09da211e98')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
