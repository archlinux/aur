# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3tuning
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=1.0.0
pkgrel=1
pkgdesc="Tuning for 'mlr3'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-bbotk
  r-checkmate
  r-data.table
  r-lgr
  r-mlr3
  r-mlr3misc
  r-paradox
  r-r6
)
optdepends=(
  r-adagio
  r-gensa
  r-irace
  r-knitr
  r-mlr3learners
  r-mlr3pipelines
  r-nloptr
  r-rmarkdown
  r-rpart
  r-testthat
  r-xgboost
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('86fdb59397b65288186cde667cf98dcf53868adf1def41d65e4e34db3cffac52')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
