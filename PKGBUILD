# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ModCon
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Modifying splice site usage by changing the mRNP code, while maintaining the genetic code"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only AND LGPL-3.0-only')
depends=(
  perl
  r-data.table
)
optdepends=(
  r-dplyr
  r-knitr
  r-rmarkdown
  r-shiny
  r-shinycssloaders
  r-shinydashboard
  r-shinyfiles
  r-shinyjs
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e6fe547327b6fa6c2881d061c0d3a8f4')
b2sums=('91e060a05443dcf0941bd940ca16e300207c8557cf628e7a5cace3c01f128eca01ffcbcfdfa8d6639e300f33a40a8860cd5402d7f214fd73f7da8b17a518b416')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
