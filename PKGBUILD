# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cplm
_pkgver=0.7-10
pkgname=r-${_pkgname,,}
pkgver=0.7.10
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
sha256sums=('b3533e031f79579ce31d7dd3765ff0ea3b44435fafc258d84a18162340981257')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
