# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gRbase
_pkgver=2.0.2
pkgname=r-${_pkgname,,}
pkgver=2.0.2
pkgrel=1
pkgdesc='A Package for Graphical Modelling in R'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
  r-magrittr
  r-rcpp
  r-rcpparmadillo
  r-rcppeigen
)
optdepends=(
  r-knitr
  r-microbenchmark
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('36720e49b82e360166386c9b3bf17838aeb6d9b921e7e01d48f8a115f9a02e97')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
