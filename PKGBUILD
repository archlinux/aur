# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PharmacoGx
_pkgver=3.0.2
pkgname=r-${_pkgname,,}
pkgver=3.0.2
pkgrel=2
pkgdesc='Analysis of Large-Scale Pharmacogenomic Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-catools
  r-checkmate
  r-coregx
  r-data.table
  r-downloader
  r-ggplot2
  r-glue
  r-jsonlite
  r-magicaxis
  r-multiassayexperiment
  r-rcolorbrewer
  r-reshape2
  r-s4vectors
  r-summarizedexperiment
  r-coop
)
optdepends=(
  r-crayon
  r-knitcitations
  r-knitr
  r-markdown
  r-pander
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f10e4313f10f39e1881cb3d19ad3078ba68fe48ee7f36861e4cdffaac8c7b79a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
