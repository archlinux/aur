# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mitch
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('92f41ffd5f1fd785a50bdbf3d016299fa66affc0c5cc6db31aea186c424f6410')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
