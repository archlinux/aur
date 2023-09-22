# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gRbase
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=2.0.0
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
sha256sums=('9b90c4615f103369a8a4500f53800e4fde9948770ce465ce7a950433d46fd942')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
