# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NHPoisson
_pkgver=3.3
pkgname=r-${_pkgname,,}
pkgver=3.3
pkgrel=3
pkgdesc='Modelling and Validation of Non Homogeneous Poisson Processes'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-car
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4d452b03d13ba6f32f456a1a55a555d1a4e5c9b6559ef43d87617636592ad6c4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
