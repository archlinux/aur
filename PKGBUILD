# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethReg
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Assessing the regulatory potential of DNA methylation regions or sites on gene transcription"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-annotationhub
  r-delayedarray
  r-dplyr
  r-experimenthub
  r-genomicranges
  r-ggplot2
  r-ggpubr
  r-iranges
  r-jaspar2024
  r-openxlsx
  r-plyr
  r-progress
  r-pscl
  r-readr
  r-rlang
  r-rsqlite
  r-s4vectors
  r-sesame
  r-sesamedata
  r-sfsmisc
  r-stringr
  r-summarizedexperiment
  r-tfbstools
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-biomart
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-data.table
  r-doparallel
  r-dorothea
  r-downloader
  r-htmltools
  r-jpeg
  r-knitr
  r-matrixstats
  r-motifmatchr
  r-png
  r-r.utils
  r-reshape2
  r-rmarkdown
  r-stager
  r-testthat
  r-viper
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b7366578bc87d246782870f8c5a50193')
b2sums=('a7b1031e904a06ec9cfb171c8c0c38b33552d79118a0e3e415a7163100466f97403234a31a869cc645acd1dcba849b792ad24fc3cc22990cd44a0ad8d4eb973e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
