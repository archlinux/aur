# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pls
_pkgver=2.8-2
pkgname=r-${_pkgname,,}
pkgver=2.8.2
pkgrel=1
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
sha256sums=('24424c3961cd52e6c72e3e46c4f2718da8b8b50ee2837110b8d508e8f721f2b8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
