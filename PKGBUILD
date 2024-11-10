# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PharmacoGx
_pkgver=3.10.0
pkgname=r-${_pkgname,,}
pkgver=3.10.0
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
sha256sums=('fa26d34dc45c4460688f32b099ce3ad82b24cdf2f40885d49dd85100c9d8c7ab')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
