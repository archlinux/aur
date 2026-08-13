# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethReg
_pkgver=1.21.0
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
md5sums=('9f8055c0f9a9829b32cb9b24dab7d815')
b2sums=('392f84a2089fcc10b51a1dea8d8a20b34b6cec78025c5de9a77c355339dce02731052e1ee0197641069b6f2d13ecab6d688b4618525862397396674d946ddeae')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
