# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=wavethresh
_pkgver=4.7.0
pkgname=r-${_pkgname,,}
pkgver=4.7.0
pkgrel=1
pkgdesc='Wavelets Statistics and Transforms'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f50725565d6a956d3ce5c948305ba5b2d55d3fbf2f8a6e4647d2656e2aaaf52c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
