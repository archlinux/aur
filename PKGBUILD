# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BloodGen3Module
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='This R package for performing module repertoire analyses and generating fingerprint representations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-circlize
  r-complexheatmap
  r-experimenthub
  r-ggplot2
  r-gtools
  r-limma
  r-matrixstats
  r-preprocesscore
  r-randomcolor
  r-reshape2
  r-summarizedexperiment
  r-testthat
  r-v8
)
optdepends=(
  r-biocgenerics
  r-devtools
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6f141ef89ac2826d5984da032e59eabed4cf173a92187e11419d1a90bcf81d06')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
