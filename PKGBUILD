# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MESS
_pkgver=0.5.12
pkgname=r-${_pkgname,,}
pkgver=0.5.12
pkgrel=3
pkgdesc='Miscellaneous Esoteric Statistical Scripts'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-clipr
  r-geem
  r-geepack
  r-ggformula
  r-ggplot2
  r-glmnet
  r-kinship2
  r-mvtnorm
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-knitr
  r-lme4
  r-magrittr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('41e07993e67a8aab52d9d4d07a06d654186ac8a8db9b740763ed5d481f01dcf7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
