# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=smurf
_pkgver=1.1.3
pkgname=r-${_pkgname,,}
pkgver=1.1.3
pkgrel=1
pkgdesc='Sparse Multi-Type Regularized Feature Modeling'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-catdata
  r-glmnet
  r-rcolorbrewer
  r-rcpp
  r-rcpparmadillo
  r-speedglm
)
optdepends=(
  r-bookdown
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eb0d3764321760e9ab6da26575c9136cef96cd73324e8b9a51209fb0f46f2959')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
