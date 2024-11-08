# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3tuning
_pkgver=1.2.0
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
md5sums=('d0a43875f6cc01bcbe8b75d84f7bc938')
b2sums=('351824341239192725f7394ea883c016073a3183c9126bbba4050bf673c8ecea813b25022cee18d2d90395b87184809363d29faf695d6ebd1a719cb2b8bd612a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
