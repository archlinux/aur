# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ashr
_pkgver=2.2-63
pkgname=r-${_pkgname,,}
pkgver=2.2.63
pkgrel=1
pkgdesc='Methods for Adaptive Shrinkage, using Empirical Bayes'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-etrunct
  r-invgamma
  r-mixsqp
  r-rcpp
  r-squarem
  r-truncnorm
)
optdepends=(
  r-ggplot2
  r-knitr
  r-rebayes
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7fa1957ed3cf0f1f20939b6ebf71fc04ab983ca77616f7b80ce9e9e6fad457c9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
