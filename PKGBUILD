# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hypeR
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=2.4.0
pkgrel=1
pkgdesc='An R Package For Geneset Enrichment Workflows'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocstyle
  r-dplyr
  r-ggforce
  r-ggplot2
  r-htmltools
  r-httr
  r-igraph
  r-kableextra
  r-magrittr
  r-msigdbr
  r-openxlsx
  r-purrr
  r-r6
  r-reactable
  r-reshape2
  r-rlang
  r-rmarkdown
  r-scales
  r-shiny
  r-stringr
  r-visnetwork
)
optdepends=(
  r-devtools
  r-knitr
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fb23dd48570e60c58e84099da182d956ebe57732cc28a7de2b048723f0aa3489')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
