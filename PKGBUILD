# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3tuning
_pkgver=1.7.0
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
  r-cli
  r-data.table
  r-lgr
  r-mlr3
  r-mlr3misc
  r-paradox
  r-r6
)
optdepends=(
  r-future
  r-gensa
  r-irace
  r-knitr
  r-libcmaesr
  r-mirai
  r-mlflow
  r-mlr3learners
  r-mlr3pipelines
  r-nloptr
  r-processx
  r-redux
  r-rmarkdown
  r-rush
  r-testthat
  r-xgboost
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3dc70a51cccba5cf37e179fbb3e5eb88')
b2sums=('9773308563bd3056ddc322cac4e121090775c494568ee14d9b315bfb7b62319d283cd2dc44c65b7fc9bd134e6f8a70e4b618c4b4879eb017865eb63d70bdfb80')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
