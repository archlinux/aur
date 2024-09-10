# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3tuning
_pkgver=1.0.1
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
md5sums=('969505c948c86f4524c0c9b4c69c6780')
b2sums=('dddfb4d9a331d59f7b44cc447add37d81e61cfc8929f6cc5e115e8378cfeea271865bca2003b1c9a621e15c661d367025f32e345229ead87e4aa6a35e7a1dd8a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
