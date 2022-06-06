# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=intergraph
_pkgver=2.0-2
pkgname=r-${_pkgname,,}
pkgver=2.0.2
pkgrel=4
pkgdesc='Coercion Routines for Network Data Objects'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
  r-network
)
optdepends=(
  r-knitr
  r-roxygen2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6cbe77f1e87fa1c110db2d46010f2f3ae72bfdb708ce2ca84c1cdc2cd6eb47a1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
