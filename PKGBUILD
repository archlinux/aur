# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioNERO
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Biological Network Reconstruction Omnibus'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-complexheatmap
  r-deseq2
  r-dynamictreecut
  r-genie3
  r-ggnetwork
  r-ggnewscale
  r-ggplot2
  r-ggpubr
  r-igraph
  r-intergraph
  r-matrixstats
  r-minet
  r-netrep
  r-networkd3
  r-rcolorbrewer
  r-reshape2
  r-summarizedexperiment
  r-sva
  r-wgcna
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('72163387c864b125f12ac4dbd2751e12b919739c9ebb6e855c9bb307e892dfdb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
