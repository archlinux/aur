# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=eulerr
_pkgver=7.0.4
pkgname=r-${_pkgname,,}
pkgver=7.0.4
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
sha256sums=('1e3e438c1402c8b6b8adf34a00e812128c83aee661d4ff2b792e4b3836d4ca72')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
