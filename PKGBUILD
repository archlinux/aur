# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mitch
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Multi-Contrast Gene Set Enrichment Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-beeswarm
  r-echarts4r
  r-ggally
  r-ggplot2
  r-gplots
  r-gridextra
  r-kableextra
  r-knitr
  r-network
  r-plyr
  r-reshape2
  r-rmarkdown
)
optdepends=(
  r-stringi
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5c9e6f39e8a432a6b6416014445cc0ee18e3283008d46d9d3cdfc6e2a4a72ea9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
