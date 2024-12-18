# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ELMER
_pkgver=2.30.0
pkgname=r-${_pkgname,,}
pkgver=2.30.0
pkgrel=1
pkgdesc='Inferring Regulatory Element Landscapes and Transcription Factor Networks Using Cancer Methylomes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-circlize
  r-complexheatmap
  r-delayedarray
  r-doparallel
  r-downloader
  r-dplyr
  r-elmer.data
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-ggpubr
  r-ggrepel
  r-gridextra
  r-gviz
  r-iranges
  r-magrittr
  r-multiassayexperiment
  r-plotly
  r-plyr
  r-progress
  r-purrr
  r-readr
  r-reshape
  r-reshape2
  r-rmarkdown
  r-rtracklayer
  r-rvest
  r-s4vectors
  r-scales
  r-stringr
  r-summarizedexperiment
  r-tcgabiolinks
  r-tibble
  r-tidyr
  r-xml2
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-covr
  r-data.table
  r-dt
  r-experimenthub
  r-genomicinteractions
  r-knitr
  r-r.utils
  r-sesamedata
  r-testthat
  r-webshot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('18b0f782ea9fb3cd35d37144ccebec2b000fa0b4539cd83eb7c6bcc45ed8fb8a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
