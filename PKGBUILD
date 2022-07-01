# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNifti
_pkgver=1.4.1
pkgname=r-${_pkgname,,}
pkgver=1.4.1
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
sha256sums=('22c6ddf1c19dcb95b818cbbbf0af72e2fae06004b61a40d382a4f19038fc1215')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
