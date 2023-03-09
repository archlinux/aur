# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gRain
_pkgver=1.3.13
pkgname=r-${_pkgname,,}
pkgver=1.3.13
pkgrel=1
pkgdesc='Graphical Independence Networks'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-broom
  r-graph
  r-grbase
  r-igraph
  r-magrittr
  r-rcpp
  r-rcpparmadillo
  r-rcppeigen
  r-rgraphviz
)
optdepends=(
  r-knitr
  r-microbenchmark
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3805ca73adec3d74325ea8a2208b9c8473e012010e5902e0e262d4e985b77dd5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
