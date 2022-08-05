# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=paradox
_pkgver=0.10.0
pkgname=r-${_pkgname,,}
pkgver=0.10.0
pkgrel=1
pkgdesc='Define and Work with Parameter Spaces for Complex Algorithms'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-backports
  r-checkmate
  r-data.table
  r-mlr3misc
  r-r6
)
optdepends=(
  r-knitr
  r-lhs
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0df291fa265203bd5e5dde87c61ebc23fc3ee6fa09329507078e5e8d26170922')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
