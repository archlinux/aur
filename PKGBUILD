# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=benchdamic
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Benchmark of differential abundance methods on microbiome data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-aldex2
  r-ancombc
  r-biocparallel
  r-corncob
  r-cowplot
  r-dearseq
  r-deseq2
  r-edger
  r-ggdendro
  r-ggplot2
  r-ggridges
  r-limma
  r-lme4
  r-mast
  r-metagenomeseq
  r-mglm
  r-noiseq
  r-phyloseq
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-seurat
  r-summarizedexperiment
  r-tidytext
  r-treesummarizedexperiment
  r-zinbwave
)
optdepends=(
  r-biocstyle
  r-kableextra
  r-knitr
  r-rmarkdown
  r-spsimseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('17bf9bcbf377b97ac723f65ef4075a5ac6202e144e99f0c3a19a9ea4cf72ffa9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
