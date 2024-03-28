# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=eulerr
_pkgver=7.0.2
pkgname=r-${_pkgname,,}
pkgver=7.0.2
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
sha256sums=('4e0dce2b240a97e2bfe22b3848c7ff9e1fc684ed3b007c94adb97a8bc6a0842b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
