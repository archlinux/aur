# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gRbase
_pkgver=1.8.9
pkgname=r-${_pkgname,,}
pkgver=1.8.9
pkgrel=1
pkgdesc='A Package for Graphical Modelling in R'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-graph
  r-igraph
  r-magrittr
  r-rbgl
  r-rcpp
  r-rcpparmadillo
  r-rcppeigen
  r-rgraphviz
  r-biocmanager
)
optdepends=(
  r-knitr
  r-microbenchmark
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dacab442d896e4593c6196e8446b75c4144a1c4ebc3f039dc624516038193d7e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
