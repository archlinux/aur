# system requirements: C++11, GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scPipe
_pkgver=1.20.4
pkgname=r-${_pkgname,,}
pkgver=1.20.4
pkgrel=1
pkgdesc='pipeline for single cell RNA-seq data analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  gcc
  make
  r
  r-annotationdbi
  r-basilisk
  r-biocgenerics
  r-biomart
  r-biostrings
  r-data.table
  r-dplyr
  r-dropletutils
  r-flexmix
  r-genomicalignments
  r-genomicranges
  r-ggally
  r-ggplot2
  r-glue
  r-hash
  r-iranges
  r-magrittr
  r-mclust
  r-multiassayexperiment
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-purrr
  r-rcpp
  r-reshape
  r-reticulate
  r-rhtslib
  r-rlang
  r-robustbase
  r-rsamtools
  r-rsubread
  r-rtracklayer
  r-s4vectors
  r-scales
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
  r-testthat
  r-tibble
  r-tidyr
  r-zlibbioc
)
optdepends=(
  r-biocstyle
  r-dt
  r-genomicfeatures
  r-grid
  r-igraph
  r-kableextra
  r-knitr
  r-locstra
  r-plotly
  r-rann
  r-rcolorbrewer
  r-readr
  r-reshape2
  r-rmarkdown
  r-scater
  r-shiny
  r-testthat
  r-umap
  r-xml2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('36219e26515a818aaf577207a184b4b826530b0bb8b5ded40bc84d08f751bfb3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
