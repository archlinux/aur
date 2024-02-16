# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=eulerr
_pkgver=7.0.1
pkgname=r-${_pkgname,,}
pkgver=7.0.1
pkgrel=1
pkgdesc='Area-Proportional Euler and Venn Diagrams with Ellipses'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-gensa
  r-polyclip
  r-polylabelr
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-covr
  r-knitr
  r-lattice
  r-pbrackets
  r-rconics
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6c3caa93e4f3c8bec3198020f1436fe617acb4eb52799790cb0612f548721eb1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
