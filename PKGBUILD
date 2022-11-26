# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tictoc
_pkgver=1.1
pkgname=r-${_pkgname,,}
pkgver=1.1
pkgrel=3
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
sha256sums=('120f868ba276bda70c8edef5d6c092586cf73db0fa02eb5459d8f55350fb474d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
