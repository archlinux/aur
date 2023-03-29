# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splines2
_pkgver=0.4.8
pkgname=r-${_pkgname,,}
pkgver=0.4.8
pkgrel=3
pkgdesc='Regression Spline Functions and Classes'
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
  r-rcpparmadillo
  r-rmarkdown
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f6c81d2ae58f73f3f79d013555ace4a4734d76435eee154359babd973a25aca2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
