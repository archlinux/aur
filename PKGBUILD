# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3tuning
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Hyperparameter Optimization for 'mlr3'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only')
depends=(
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
  r-future
  r-gensa
  r-irace
  r-knitr
  r-mlflow
  r-mlr3learners
  r-mlr3pipelines
  r-nloptr
  r-rmarkdown
  r-rush
  r-testthat
  r-xgboost
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('101dfefc442254f3a19f6677986d69fc')
b2sums=('5a6dc48f55fa1c29db8845607cf4a15cd7f3f513f693684160cd62915696281a18c710ec9178c92da938efc8212711b38dc181b86378152281f5f3e428558910')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
