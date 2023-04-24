# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tictoc
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=1.2
pkgrel=1
pkgdesc='Functions for Timing R Scripts, as Well as Implementations of Stack and List Structures'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f05ea4b4142a90b0dc5d10356be3748625ef86bbd0e4399c56455654165ff20c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
