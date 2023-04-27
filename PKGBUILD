# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OmnipathR
_pkgver=3.8.0
pkgname=r-${_pkgname,,}
pkgver=3.8.0
pkgrel=1
pkgdesc='OmniPath web service client and more'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-checkmate
  r-crayon
  r-curl
  r-digest
  r-dplyr
  r-httr
  r-igraph
  r-jsonlite
  r-later
  r-logger
  r-magrittr
  r-progress
  r-purrr
  r-rappdirs
  r-readr
  r-readxl
  r-rlang
  r-rmarkdown
  r-rvest
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
  r-withr
  r-xml2
  r-yaml
)
optdepends=(
  r-biocstyle
  r-biomart
  r-bookdown
  r-dnet
  r-ggplot2
  r-ggraph
  r-gprofiler2
  r-knitr
  r-mlrmbo
  r-parallelmap
  r-paramhelpers
  r-rgraphviz
  r-smoof
  r-suprahex
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0e12ea562e135a8c670b5b4ec4000463c9ee12bd6d957bfcc2db36b5ecd85664')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
