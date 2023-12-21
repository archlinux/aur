# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3learners
_pkgver=0.5.8
pkgname=r-${_pkgname,,}
pkgver=0.5.8
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
  r-e1071
  r-glmnet
  r-kknn
  r-knitr
  r-lgr
  r-mass
  r-nnet
  r-pracma
  r-ranger
  r-rgenoud
  r-rmarkdown
  r-testthat
  r-xgboost
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('af38c77ab6763786266b80fcd3f6408f90937a26c8fc2fa84486b99f5ac58460')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
