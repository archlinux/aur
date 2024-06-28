# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3learners
_pkgver=0.7.0
pkgname=r-${_pkgname,,}
pkgver=0.7.0
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
sha256sums=('622305e93c645af9f67be2553816960e5f6a7bdcd7909c2aa8bdbb8e6bed6e6a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
