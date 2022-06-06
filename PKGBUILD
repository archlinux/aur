# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=matchingR
_pkgver=1.3.3
pkgname=r-${_pkgname,,}
pkgver=1.3.3
pkgrel=4
pkgdesc='Matching Algorithms in R and C++'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2fdaa4a49d6835f0df31eaeb98a002332152dd76523cc44467bad81e957221f3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
