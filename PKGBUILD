# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethReg
_pkgver=1.18.0
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
md5sums=('83ea175de92d2fdd55287c94ce07b8a4')
b2sums=('5907f154c1e87e0ee9973cdb50e95604d78f3e12c79c122759ea953dbed7b4df60ebafe5b034ea349445a488d56ceda50dc2131c41bce2515d3c535e6a43e7e7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
