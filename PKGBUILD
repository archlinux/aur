# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=dartR.sim
_pkgver=0.71
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
  r-doparallel
  r-ggrepel
  r-foreach
  r-dplyr
  r-dartr.popgen
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3a0b4a11dcaf2902339ebaccc22eb04f')
b2sums=('2eff5f7d31097d6fbfd77c2308d3d947c6e32e7d8c0d89419f2e71b249ea1a2ca4924e9b35c1077ed00aff5098310711409e8317f4e0fc5bb6a14a0783abc7d5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
