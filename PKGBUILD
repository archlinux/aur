# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RFOC
_pkgver=3.4-15
pkgname=r-${_pkgname,,}
pkgver=3.4.15
pkgrel=1
pkgdesc='Graphics for Spherical Distributions and Earthquake Focal Mechanisms'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fields
  r-geomap
  r-rpmg
  r-rseis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6f860fdfebbe16f4b5621803bee2cda75be2cc078d44e8f7fa13bdec4a42c12c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
