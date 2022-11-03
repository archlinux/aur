# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EWCE
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Expression Weighted Celltype Enrichment'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationhub
  r-biomart
  r-cowplot
  r-ewcedata
  r-experimenthub
  r-future
  r-ggdendro
  r-ggplot2
  r-gridextra
  r-hgnchelper
  r-limma
  r-reshape2
  r-rnomni
  r-scales
  r-stringr
  r-summarizedexperiment
  r-singlecellexperiment
  r-biocparallel
  r-orthogene
  r-data.table
)
optdepends=(
  r-biocstyle
  r-data.table
  r-devtools
  r-knitr
  r-markdown
  r-memoise
  r-readxl
  r-rmarkdown
  r-sctransform
  r-singlecellexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6b97c3773d35e9a6dfdd4d7e6326580bb55e40db8db3818372c1cb1287e15ab4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
