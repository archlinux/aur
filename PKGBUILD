# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=svd
_pkgver=0.5.3
pkgname=r-${_pkgname,,}
pkgver=0.5.3
pkgrel=1
pkgdesc='Interfaces to Various State-of-Art SVD and Eigensolvers'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
)
optdepends=(
  r-testthat
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('14cea5447aaee391b363efc50750b80856262c02407999f428c2513705f9b3e6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
