# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppNumerical
_pkgver=0.4-0
pkgname=r-${_pkgname,,}
pkgver=0.4.0
pkgrel=4
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
sha256sums=('33e659b65b1ec05034d4f3c3fa204df396e476e49dcd3e43b650c66a287622a9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
