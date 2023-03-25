# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timsac
_pkgver=1.3.8
pkgname=r-${_pkgname,,}
pkgver=1.3.8
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
sha256sums=('9cea5a4d187196569101d5f38cb5ccd6159d997dd16a4456492984c72d235d80')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
