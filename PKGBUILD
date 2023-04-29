# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioNERO
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Biological Network Reconstruction Omnibus'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-complexheatmap
  r-dynamictreecut
  r-genie3
  r-ggnetwork
  r-ggnewscale
  r-ggplot2
  r-ggrepel
  r-igraph
  r-intergraph
  r-matrixstats
  r-minet
  r-netrep
  r-networkd3
  r-patchwork
  r-rcolorbrewer
  r-reshape2
  r-summarizedexperiment
  r-sva
  r-wgcna
)
optdepends=(
  r-biocstyle
  r-covr
  r-deseq2
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6c7f2c3c1e57233449ea2f212a38769a7638968d11cea5817d2439192bd9631c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
