# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gRain
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Graphical Independence Networks'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-broom
  r-grbase
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
sha256sums=('c0ccd33448fff881aea6b09927da99af37be63f4795abe4c65591fbbcbb09690')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
