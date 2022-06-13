# system requirements: gmp (>= 4.38, optional), libxml2 (optional), glpk(optional)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=igraph
_pkgver=1.3.2
pkgname=r-${_pkgname,,}
pkgver=1.3.2
pkgrel=1
pkgdesc='Network Analysis and Visualization'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-magrittr
  r-pkgconfig
)
optdepends=(
  r-ape
  r-digest
  r-graph
  r-igraphdata
  r-rgl
  r-scales
  r-stats4
  r-tcltk
  r-testthat
  r-withr
  gmp
  glpk
  libxml2
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0f5066180e223e165d28cee050054008ca23102e8392ff4ecd72e733537ec320')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
