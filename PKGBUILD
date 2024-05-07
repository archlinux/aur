# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethReg
_pkgver=1.14.0
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
md5sums=('d0b31767857b067628875b92dfa6fa7d')
b2sums=('e9a912a0f59b1163e51cc8b8ef53bacbb75b1dbf19999c4fbbf9d52f72d20c6756d9482b65a78ff349dc488f2db24e4cda3f172e0982d21abeb0e644d7501380')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
