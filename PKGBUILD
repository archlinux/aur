# system requirements: little-endian platform
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fst
_pkgver=0.9.8
pkgname=r-${_pkgname,,}
pkgver=0.9.8
pkgrel=3
pkgdesc='Lightning Fast Serialization of Data Frames'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('AGPL')
depends=(
  r
  r-rcpp
  r-fstcore
)
optdepends=(
  r-bit64
  r-crayon
  r-data.table
  r-lintr
  r-nanotime
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('44c7e889879c2a3a704b70152196e27b6fc1d700062056f9a9c0a49cb98d2665')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
