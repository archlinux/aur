# system requirements: pandoc (http://pandoc.org/installing.html) forgenerating reports from markdown files.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BatchQC
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Batch Effects Quality Control Software'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-corpcor
  r-ggvis
  r-gplots
  r-heatmaply
  r-knitr
  r-limma
  r-matrixstats
  r-mcmcpack
  r-moments
  r-pander
  r-reshape2
  r-rmarkdown
  r-shiny
  r-sva
  pandoc
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('722854d622830015080790fdd555001cd20e852f30f30bd16ed04004398791bd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
