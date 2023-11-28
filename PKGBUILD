# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNifti
_pkgver=1.5.1
pkgname=r-${_pkgname,,}
pkgver=1.5.1
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
sha256sums=('a59405c8b08f8072210b2e2817b8d0fcc52c8c2ecbb14533695035ba75a87e65')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
