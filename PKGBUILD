# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timsac
_pkgver=1.3.8-2
pkgname=r-${_pkgname,,}
pkgver=1.3.8.2
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
sha256sums=('4b992214349fc3fe79c0802e0fc8782d4894ff8b201627fd7fb0ac960c811586')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
