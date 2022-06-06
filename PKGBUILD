# system requirements: little-endian platform
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fstcore
_pkgver=0.9.12
pkgname=r-${_pkgname,,}
pkgver=0.9.12
pkgrel=3
pkgdesc="R Bindings to the 'Fstlib' Library"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MPL2')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-lintr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8f86e7cd4074cfda812c8e5dcf0f03a5d02d37795c16c7511e11e2262c32b5a8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
