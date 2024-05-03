# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ProteoDisco
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Generation of customized protein variant databases from genomic variants, splice-junctions and manual sequences'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-checkmate
  r-cleaver
  r-dplyr
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-parallellogger
  r-plyr
  r-rlang
  r-s4vectors
  r-tibble
  r-tidyr
  r-variantannotation
  r-xvector
)
optdepends=(
  r-annotationdbi
  r-biocstyle
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-delayedarray
  r-devtools
  r-ggplot2
  r-knitr
  r-markdown
  r-matrixstats
  r-org.hs.eg.db
  r-purrr
  r-rcurl
  r-readr
  r-reshape2
  r-rmarkdown
  r-rtracklayer
  r-scales
  r-seqinr
  r-stringr
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('14ef61d328d8862edc28c7b364711e2e8e273f6042fcc614b930366563b48d81')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
