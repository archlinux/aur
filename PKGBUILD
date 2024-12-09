# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mitch
_pkgver=1.18.4
pkgname=r-${_pkgname,,}
pkgver=1.18.4
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
  r-plyr
  r-reshape2
  r-rmarkdown
)
optdepends=(
  r-stringi
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2534a667c3f35ee5f5e37b5502b058fe6340be19d2cd92eb31f93f5f94a6e5f0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
