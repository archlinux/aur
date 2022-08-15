# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3learners
_pkgver=0.5.4
pkgname=r-${_pkgname,,}
pkgver=0.5.4
pkgrel=1
pkgdesc="Recommended Learners for 'mlr3'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-checkmate
  r-data.table
  r-mlr3
  r-mlr3misc
  r-paradox
  r-r6
)
optdepends=(
  r-dicekriging
  r-distr6
  r-e1071
  r-glmnet
  r-kknn
  r-knitr
  r-lgr
  r-mass
  r-mlr3proba
  r-nnet
  r-pracma
  r-ranger
  r-rgenoud
  r-rmarkdown
  r-testthat
  r-xgboost
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7378a08a90cdc4e7da7cbf23f183beac7d3b3f0250254bb576facb0db7c44269')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
