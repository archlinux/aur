# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=twoddpcr
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Classify 2-d Droplet Digital PCR (ddPCR) data and quantify the number of starting molecules'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-hexbin
  r-rcolorbrewer
  r-s4vectors
  r-scales
  r-shiny
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1a502a55c6ae49ef3708d24762454a8ce74116a9959e8f0c0ce11ae624ad58fa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
