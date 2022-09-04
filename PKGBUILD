# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gRain
_pkgver=1.3.11
pkgname=r-${_pkgname,,}
pkgver=1.3.11
pkgrel=1
pkgdesc='Graphical Independence Networks'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
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
sha256sums=('906bc018d67b4c68db6b9b781b9b3b79a06f6c25a67509af42a8cf0c0251cace')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
