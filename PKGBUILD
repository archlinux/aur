# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NHPoisson
_pkgver=3.4
pkgname=r-${_pkgname,,}
pkgver=3.4
pkgrel=1
pkgdesc='Modelling and Validation of Non Homogeneous Poisson Processes'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-car
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('35e7db2ddfea12bd076f15f14b8d799cecae3103082a9ae0be4d2312af51c23d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
