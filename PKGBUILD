# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NanoMethViz
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=2.2.0
pkgrel=1
pkgdesc='Visualise methlation data from Oxford Nanopore sequencing'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Apache')
depends=(
  r
  r-annotationdbi
  r-assertthat
  r-biocsingular
  r-bsseq
  r-cpp11
  r-data.table
  r-dplyr
  r-e1071
  r-forcats
  r-fs
  r-genomicranges
  r-ggplot2
  r-ggthemes
  r-glue
  r-limma
  r-patchwork
  r-purrr
  r-rcpp
  r-readr
  r-rlang
  r-rsamtools
  r-rsqlite
  r-s4vectors
  r-scales
  r-scico
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-withr
  r-zlibbioc
  gcc
)
optdepends=(
  r-covr
  r-dss
  r-homo.sapiens
  r-knitr
  r-mus.musculus
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('818a7b18c15ebe791f70b30badaafccda0a1e9de2d285de0f75d9576e11fb363')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
