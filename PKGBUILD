# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=intergraph
_pkgver=2.0-3
pkgname=r-${_pkgname,,}
pkgver=2.0.3
pkgrel=1
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
sha256sums=('354640a8ac4a1186e6d229b6c25f0535be3e456c13b1e7224a1632d3a346a7e8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
