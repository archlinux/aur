# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=longitudinalData
_pkgver=2.4.1
pkgname=r-${_pkgname,,}
pkgver=2.4.1
pkgrel=3
pkgdesc='Longitudinal Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-clv
  r-misc3d
  r-rgl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6d8b155726b5e1913711c84af3e0fc56bb3a1097e0471628572b88239f63db52')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
