# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=circRNAprofiler
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='circRNAprofiler: An R-Based Computational Framework for the Downstream Analysis of Circular RNAs'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationhub
  r-biostrings
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-deseq2
  r-dplyr
  r-edger
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-gwascat
  r-iranges
  r-magrittr
  r-r.utils
  r-readr
  r-reshape2
  r-rlang
  r-rtracklayer
  r-s4vectors
  r-seqinr
  r-stringi
  r-stringr
  r-universalmotif
)
optdepends=(
  r-biocmanager
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsgenome.mmusculus.ucsc.mm10
  r-bsgenome.mmusculus.ucsc.mm9
  r-devtools
  r-ggpubr
  r-gridextra
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-venndiagram
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c3e46196b2004face816959f320d347185a7459250fe6409b4acc0fb755e0e25')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
