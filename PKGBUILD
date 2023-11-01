# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scTensor
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=2.12.0
pkgrel=1
pkgdesc='Detection of cell-cell interaction from single-cell RNA-seq dataset by tensor decomposition'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-abind
  r-annotationdbi
  r-annotationhub
  r-biocmanager
  r-biocstyle
  r-category
  r-cctensor
  r-checkmate
  r-crayon
  r-dose
  r-ggplot2
  r-gostats
  r-heatmaply
  r-igraph
  r-knitr
  r-meshdbi
  r-meshr
  r-nntensor
  r-outliers
  r-plotly
  r-plotrix
  r-reactome.db
  r-reactomepa
  r-rmarkdown
  r-rsqlite
  r-rtensor
  r-s4vectors
  r-schex
  r-singlecellexperiment
  r-summarizedexperiment
  r-tagcloud
  r-visnetwork
)
optdepends=(
  r-homo.sapiens
  r-lrbasedbi
  r-sctgif
  r-seurat
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f1240c18eb9274ad5db6e67d850de7acdda1240e29744bfc042f017a077e01d3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
