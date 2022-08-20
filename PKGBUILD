# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=matrixcalc
_pkgver=1.0-5
pkgname=r-${_pkgname,,}
pkgver=1.0.5
pkgrel=7
pkgdesc='Collection of Functions for Matrix Calculations'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5906e1ef06dbc18efc7a4b370adc180ef8941b5438119703bd981d1c76a06fca')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
