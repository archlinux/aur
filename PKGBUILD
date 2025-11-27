# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TSP
_pkgver=1.2.6
pkgname=r-${_pkgname,,}
pkgver=1.2.6
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
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6d1d7a1eae6e7bd4abfbdd56d4fe4bc2cbe6d31de328778087d6fd45ef140f95')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
