# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TSP
_pkgver=1.2-2
pkgname=r-${_pkgname,,}
pkgver=1.2.2
pkgrel=1
pkgdesc='Traveling Salesperson Problem (TSP)'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-foreach
)
optdepends=(
  r-doparallel
  r-maps
  r-maptools
  r-sp
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a5d8a8f23fc0cf0cca9d2507c4135bb83e75e2ab61ef79b5d542a6acb9aa623')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
