# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NanoTube
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='An Easy Pipeline for NanoString nCounter Data Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-fgsea
  r-ggplot2
  r-limma
  r-reshape
)
optdepends=(
  r-grid
  r-kableextra
  r-knitr
  r-nanostringdiff
  r-pheatmap
  r-plotly
  r-rlang
  r-rmarkdown
  r-ruv
  r-ruvseq
  r-shiny
  r-testthat
  r-xlsx
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7b01e0bd6ee5440de5da2e4d1059992609d7e4d30875147cc9d7bf0a8b78b0f1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
