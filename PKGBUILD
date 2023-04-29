# system requirements: GNU make, C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FLAMES
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='FLAMES: Full Length Analysis of Mutations and Splicing in long read RNA-seq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bambu
  r-basilisk
  r-biocgenerics
  r-biostrings
  r-circlize
  r-complexheatmap
  r-cowplot
  r-dplyr
  r-dropletutils
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggbio
  r-ggplot2
  r-gridextra
  r-igraph
  r-jsonlite
  r-magrittr
  r-multiassayexperiment
  r-rcolorbrewer
  r-rcpp
  r-reticulate
  r-rhtslib
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-scater
  r-scran
  r-scuttle
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
  r-tidyr
  r-withr
  r-zlibbioc
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-geoquery
  r-knitr
  r-markdown
  r-r.utils
  r-rmarkdown
  r-shortread
  r-testthat
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('11c78ebb56b005d383c914bfe7186cd94a22aa7e8b8e4cef92d3a6345f04138e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
