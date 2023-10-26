# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RFOC
_pkgver=3.4-10
pkgname=r-${_pkgname,,}
pkgver=3.4.10
pkgrel=3
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
sha256sums=('b1211db8960b482ebb516233c86b075d1a1f006a88191a72fa98babd5a8e2100')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
