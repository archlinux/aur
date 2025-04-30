# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=dartR.sim
_pkgver=0.70
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Computer Simulations of 'SNP' Data"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
  r-adegenet
  r-dartr.base
  r-dartr.data
  r-data.table
  r-fields
  r-ggplot2
  r-hierfstat
  r-rcpp
  r-reshape2
  r-shiny
  r-shinybs
  r-shinyjs
  r-shinythemes
  r-shinywidgets
  r-stringi
  r-stringr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('265e9c8cb527b121b24ca20da2ae46b8')
b2sums=('97b423ef614c12322d558baeea6d22356a6a3675b4ea87e7cfce61bd7c3aa5cf8d7d762894b47312532a4fbc99459f1bedac477c2155b0a63c2fe55128fb3c26')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
