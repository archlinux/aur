# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=distr
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=2.8.0
pkgrel=4
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
sha256sums=('bb7df05d6b946bcdbbec2e3397c7c7e349b537cabfcbb13a34bcf6312a71ceb7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
