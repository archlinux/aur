# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timsac
_pkgver=1.3.8-4
pkgname=r-${_pkgname,,}
pkgver=1.3.8.4
pkgrel=1
pkgdesc='Time Series Analysis and Control Package'
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
sha256sums=('53ce2658286e18472110444d4157136ab7aa95661b2a7a24c8ea91103eb3b83e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
