# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pls
_pkgver=2.8-0
pkgname=r-${_pkgname,,}
pkgver=2.8.0
pkgrel=4
pkgdesc='Partial Least Squares and Principal Component Regression'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-mass
  r-parallel
  r-rmpi
  r-runit
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eff3a92756ca34cdc1661fa36d2bf7fc8e9f4132d2f1ef9ed0105c83594618bf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
