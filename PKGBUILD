# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=StarBioTrek
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
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
sha256sums=('4c239c5556e6c4f5404155ca80ace9db46fd59fb323fb7bc47e1d5c83eb0ef32')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
