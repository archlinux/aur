# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NanoTube
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
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
  r-qusage
  r-rlang
  r-rmarkdown
  r-ruv
  r-shiny
  r-testthat
  r-xlsx
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c7ac63d2865e04cea984914e73b1a9482f1c090d1fe21cf79f9db752c2eaa038')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
