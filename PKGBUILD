# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PharmacoGx
_pkgver=3.2.0
pkgname=r-${_pkgname,,}
pkgver=3.2.0
pkgrel=1
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
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('caa0969de59882053c04a8506b0f471fb3fc5a5d466038f33cec41a771d2a6f1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
