# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=polyclip
_pkgver=1.10-4
pkgname=r-${_pkgname,,}
pkgver=1.10.4
pkgrel=1
pkgdesc='Polygon Clipping'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('84d2c9778771d3759b49d7d16fb54c8ddc5397da3b1d21074bc4aa42c02e6f56')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
