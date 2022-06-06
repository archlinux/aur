# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rebus.datetimes
_pkgver=0.0-1
pkgname=r-${_pkgname,,}
pkgver=0.0.1
pkgrel=4
pkgdesc="Date and Time Extensions for the 'rebus' Package"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Unlimited')
depends=(
  r
  r-rebus.base
)
optdepends=(
  r-stats
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a5c22ae363a499508f78970ef855ffa0fc2e54e8e876b0fa562354ee6b209b26')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
