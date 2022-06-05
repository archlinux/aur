# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dce
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Pathway Enrichment Based on Differential Causal Effects'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-combinepvalue
  r-dplyr
  r-edger
  r-epinem
  r-expm
  r-ggplot2
  r-ggraph
  r-glm2
  r-glue
  r-graph
  r-graphite
  r-harmonicmeanp
  r-igraph
  r-logger
  r-metap
  r-mnem
  r-naturalsort
  r-org.hs.eg.db
  r-pcalg
  r-ppcor
  r-purrr
  r-reshape2
  r-rgraphviz
  r-rlang
  r-tidygraph
  r-tidyverse
  r-shadowtext
)
optdepends=(
  r-biocstyle
  r-cowplot
  r-curatedtcgadata
  r-dagitty
  r-devtools
  r-formatr
  r-knitr
  r-lmtest
  r-rmarkdown
  r-sandwich
  r-summarizedexperiment
  r-tcgautils
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('88e1c31deb4e19153e999bbca9cc147e22a7f2d454766b27e96c78b9a0bb4a93')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
