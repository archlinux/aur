# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=distr
_pkgver=2.9.0
pkgname=r-${_pkgname,,}
pkgver=2.9.0
pkgrel=1
pkgdesc='Object Oriented Implementation of Distributions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-sfsmisc
  r-startupmsg
)
optdepends=(
  r-distrex
  r-knitr
  r-svunit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('44b1465ad260b7c6a9da65848fae89003f0c1dfcda6a6f73e65d748af4797d39')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
