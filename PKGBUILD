# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NanoMethViz
_pkgver=3.2.0
pkgname=r-${_pkgname,,}
pkgver=3.2.0
pkgrel=1
pkgdesc='Visualise methlation data from Oxford Nanopore sequencing'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Apache')
depends=(
  gcc
  r
  r-annotationdbi
  r-assertthat
  r-biocsingular
  r-biostrings
  r-bsseq
  r-cli
  r-cpp11
  r-data.table
  r-dbscan
  r-dplyr
  r-e1071
  r-forcats
  r-fs
  r-genomicranges
  r-ggplot2
  r-ggrastr
  r-glue
  r-iranges
  r-limma
  r-patchwork
  r-purrr
  r-r.utils
  r-rcpp
  r-readr
  r-rlang
  r-rsamtools
  r-s4vectors
  r-scales
  r-scico
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-withr
  r-zlibbioc
)
optdepends=(
  r-biocstyle
  r-covr
  r-dss
  r-homo.sapiens
  r-knitr
  r-mus.musculus
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rmarkdown
  r-rtracklayer
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-txdb.mmusculus.ucsc.mm10.knowngene
  r-txdb.mmusculus.ucsc.mm39.refgene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fed54e69c9a5198fe63acdc75bb9efb1a827e1950210ada6edf180cc0e2b659e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
