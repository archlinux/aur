# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pls
_pkgver=2.8-3
pkgname=r-${_pkgname,,}
pkgver=2.8.3
pkgrel=1
pkgdesc='Partial Least Squares and Principal Component Regression'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-mass
  r-parallel
  r-rmpi
  r-runit
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e6eb728dd38cd4867698df06e02601ed767e69098b1daadde5beef634ae66be3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
