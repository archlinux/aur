# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PharmacoGx
_pkgver=3.6.0
pkgname=r-${_pkgname,,}
pkgver=3.6.0
pkgrel=1
pkgdesc='Analysis of Large-Scale Pharmacogenomic Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-catools
  r-checkmate
  r-coop
  r-coregx
  r-data.table
  r-downloader
  r-ggplot2
  r-jsonlite
  r-magicaxis
  r-multiassayexperiment
  r-rcolorbrewer
  r-rcpp
  r-reshape2
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-crayon
  r-knitcitations
  r-knitr
  r-markdown
  r-pander
  r-r.utils
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b71c8d7dbee66270d2d44456e74771b2713b6566c892c06e106f55c96c461bda')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
