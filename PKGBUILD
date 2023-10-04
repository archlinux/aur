# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biomartr
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=1.0.5
pkgrel=1
pkgdesc='Genomic Data Retrieval'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-biostrings
  r-curl
  r-data.table
  r-downloader
  r-dplyr
  r-fs
  r-httr
  r-jsonlite
  r-philentropy
  r-purrr
  r-r.utils
  r-rcurl
  r-readr
  r-stringr
  r-tibble
  r-withr
  r-xml
)
optdepends=(
  r-devtools
  r-knitr
  r-magrittr
  r-rmarkdown
  r-seqinr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d45daf3c5c130f0990e281a71a46a01ab69ae7b69a7fc2da20dc653f1b21dc92')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
