# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=propr
_pkgver=4.2.6
pkgname=r-${_pkgname,,}
pkgver=4.2.6
pkgrel=7
pkgdesc='Calculating Proportionality Between Vectors of Compositional Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fastcluster
  r-ggplot2
  r-igraph
  r-rcpp
)
optdepends=(
  r-aldex2
  r-biobase
  r-cccrm
  r-compositions
  r-data.table
  r-datasets
  r-ggdendro
  r-grid
  r-knitr
  r-limma
  r-parallel
  r-plotly
  r-reshape2
  r-rgl
  r-rmarkdown
  r-sdmtools
  r-testthat
  r-vegan
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cf4dca710a3e6d1ab297fc1f5b0e0be85f0e36e6885da014fd099bcfef7ff099')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
