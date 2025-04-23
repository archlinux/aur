# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=erccdashboard
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Assess Differential Gene Expression Experiments with ERCC Controls'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-edger
  r-ggplot2
  r-gplots
  r-gridextra
  r-gtools
  r-knitr
  r-limma
  r-locfit
  r-plyr
  r-qvalue
  r-reshape2
  r-rocr
  r-scales
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3c919a187dc45ff19bf67409f8ddec54d07b92698cfc71c1f443c61a02f77d80')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
