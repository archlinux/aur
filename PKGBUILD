# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FreqProf
_pkgver=0.0.1
pkgname=r-${_pkgname,,}
pkgver=0.0.1
pkgrel=4
pkgdesc='Frequency Profiles Computing and Plotting'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-reshape2
  r-shiny
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a409b4e24b302e9aa9d41833f4935177639f7606aad6b299834f0b5a061116fb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
