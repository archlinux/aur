# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=distr
_pkgver=2.9.2
pkgname=r-${_pkgname,,}
pkgver=2.9.2
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
  r-distrmod
  r-knitr
  r-robastbase
  r-roptest
  r-svunit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b52a817ed66b75defb009e2f946472ab87f693f63c43638e86b5482cd39a2e30')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
