# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=StarBioTrek
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
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
sha256sums=('8a911b8092e327038e3d0d451a70fe5dcac20fe71ca07427cf3a3460b3498e83')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
