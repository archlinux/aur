# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ADGofTest
_pkgver=0.3
pkgname=r-${_pkgname,,}
pkgver=0.3
pkgrel=4
pkgdesc='Anderson-Darling GoF test'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9cd9313954f6ecd82480d373f6c5371ca84ab33e3f5c39d972d35cfcf1096846')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
