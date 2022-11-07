# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=StarBioTrek
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='StarBioTrek'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-e1071
  r-ggplot2
  r-graphite
  r-igraph
  r-mlmetrics
  r-reshape2
  r-rocr
  r-spidermir
)
optdepends=(
  r-biocstyle
  r-devtools
  r-grid
  r-knitr
  r-png
  r-qgraph
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a3ebb3d9137e28f72555ff991a7952055e8d53bb7c2c3fc3d3953f5f9ba0460a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
