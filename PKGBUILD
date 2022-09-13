# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=benchdamic
_pkgver=1.2.5
pkgname=r-${_pkgname,,}
pkgver=1.2.5
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
  r-cowplot
  r-dearseq
  r-deseq2
  r-edger
  r-ffpe
  r-ggdendro
  r-ggplot2
  r-limma
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
  r-curatedmetagenomicdata
  r-hmp16sdata
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('13277f9afd7ba8298c7c03f9ccd0e3e99eb64b24bfc07e36f81ac5e56b61b99a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
