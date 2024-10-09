# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gRain
_pkgver=1.4.3
pkgname=r-${_pkgname,,}
pkgver=1.4.3
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
sha256sums=('fb65cc5b2b057457684de24ad50c1ef6d9d65e0abd9c630ec71dd18594839d0a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
