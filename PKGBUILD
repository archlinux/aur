# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=celestial
_pkgver=1.4.6
pkgname=r-${_pkgname,,}
pkgver=1.4.6
pkgrel=4
pkgdesc='Collection of Common Astronomical Conversion Routines and Functions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-nistunits
  r-pracma
  r-rann
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9f647f41465ac65b254717698f1978871c378ad8e6ccaa693abf579437069abe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
