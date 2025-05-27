# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TSP
_pkgver=1.2-5
pkgname=r-${_pkgname,,}
pkgver=1.2.5
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
sha256sums=('ab51ca1514d16ad488592918227f3333e9b0e7969f6d7757446b0d92f6aa4c20')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
