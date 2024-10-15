# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3tuning
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('7b77502e589be0b7542a0be557377df1')
b2sums=('e78d65d3fdf36e88cd7be1ae52205d767ba292662dcd08f171943d23add0b652e4fcf175045234783716c4025eebd325f363f74d5aac6b7ef0990fec29f927e0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
