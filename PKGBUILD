# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cplm
_pkgver=0.7-12
pkgname=r-${_pkgname,,}
pkgver=0.7.12
pkgrel=1
pkgdesc='Compound Poisson Linear Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-biglm
  r-coda
  r-ggplot2
  r-minqa
  r-reshape2
  r-statmod
  r-tweedie
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ac7bfe21c13ceb5c1a8b4b23955febdd2948fcba5ac2a60906c907aaa7040bd4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
