# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TSP
_pkgver=1.2-1
pkgname=r-${_pkgname,,}
pkgver=1.2.1
pkgrel=4
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
sha256sums=('2bb5febff3b0bccc5ab4b85f509b841a48a8a1f136ca2feff251c08cc9ba46dd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
