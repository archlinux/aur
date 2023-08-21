# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splancs
_pkgver=2.01-44
pkgname=r-${_pkgname,,}
pkgver=2.01.44
pkgrel=1
pkgdesc='Spatial and Space-Time Point Pattern Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-sp
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08d46df9b56488925cc1b66261cf1134292ce4b5174b45e066eeb1e951dec171')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
