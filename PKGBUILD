# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=erccdashboard
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
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
sha256sums=('3931aa891940dc6cf4ce36a3c4daefa942f1e0710203dc99bc4105a31f6ca2a3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
