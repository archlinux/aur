# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hypeR
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='An R Package For Geneset Enrichment Workflows'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
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
sha256sums=('444f162726c80637daa02719446b2752e6bd66d3052d3d609b43942d530865fa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
