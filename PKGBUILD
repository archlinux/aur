# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNifti
_pkgver=1.9.0
pkgname=r-${_pkgname,,}
pkgver=1.9.0
pkgrel=1
pkgdesc='Fast R and C++ Access to NIfTI Images'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-covr
  r-oro.nifti
  r-reportr
  r-shades
  r-testthat
  r-tractor.base
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('026c62eee4ab1dc3ed00d54f789cec1a5970b2edaea485b9e35e97a59fdd1ce4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
