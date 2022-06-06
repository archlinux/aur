# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pamr
_pkgver=1.56.1
pkgname=r-${_pkgname,,}
pkgver=1.56.1
pkgrel=4
pkgdesc='Pam: Prediction Analysis for Microarrays'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d0e527f2336ee4beee91eefb2a8f0dfa96413d9b5a5841d6fc7ff821e67c9779')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
