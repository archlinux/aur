# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3misc
_pkgver=0.13.0
pkgname=r-${_pkgname,,}
pkgver=0.13.0
pkgrel=1
pkgdesc="Helper Functions for 'mlr3'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-backports
  r-checkmate
  r-data.table
  r-digest
  r-r6
)
optdepends=(
  r-callr
  r-evaluate
  r-paradox
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cdc6655e468eb516437cb47419768cd23ca51f9b37e234d1968f2d833c2ca62c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
