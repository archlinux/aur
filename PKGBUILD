# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppNumerical
_pkgver=0.5-0
pkgname=r-${_pkgname,,}
pkgver=0.5.0
pkgrel=1
pkgdesc="'Rcpp' Integration for Numerical Computing Libraries"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-rcppeigen
)
optdepends=(
  r-knitr
  r-mvtnorm
  r-prettydoc
  r-rcppeigen
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('596127b4d5b5b24f8ab1f61c0e26b5d290b4f1d854f91bf08759eec637020b96')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
