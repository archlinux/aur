# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scTreeViz
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='R/Bioconductor package to interactively explore and visualize single cell RNA-seq datasets with hierarhical annotations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-clustree
  r-data.table
  r-digest
  r-epivizr
  r-epivizrdata
  r-epivizrserver
  r-ggplot2
  r-ggraph
  r-httr
  r-igraph
  r-rtsne
  r-s4vectors
  r-scater
  r-scran
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
  r-sys
)
optdepends=(
  r-biocstyle
  r-epivizrstandalone
  r-genomeinfodb
  r-knitr
  r-metagenomeseq
  r-msd16s
  r-rmarkdown
  r-sc3
  r-scrnaseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a943719db0720844a54ac53d976da7385085dce7882d4d6ba331a5a1769b8ee')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
