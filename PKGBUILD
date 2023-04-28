# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethReg
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Assessing the regulatory potential of DNA methylation regions or sites on gene transcription'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationhub
  r-delayedarray
  r-dplyr
  r-experimenthub
  r-genomicranges
  r-ggplot2
  r-ggpubr
  r-iranges
  r-plyr
  r-progress
  r-pscl
  r-readr
  r-rlang
  r-s4vectors
  r-sesame
  r-sesamedata
  r-sfsmisc
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-biomart
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-doparallel
  r-dorothea
  r-downloader
  r-htmltools
  r-jaspar2022
  r-jpeg
  r-knitr
  r-matrixstats
  r-motifmatchr
  r-parallel
  r-png
  r-r.utils
  r-reshape2
  r-rmarkdown
  r-stager
  r-testthat
  r-tfbstools
  r-viper
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('59b3f4e799651421b55fed95f5f5a6ee097acb34afff119da246e2d14d52e14f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
