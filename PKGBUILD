# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=eulerr
_pkgver=6.1.1
pkgname=r-${_pkgname,,}
pkgver=6.1.1
pkgrel=4
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
sha256sums=('294c38b4b39e3ed25f4fb4d569d98c3b9fa3507fc220779047a0e11486b88d52')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
