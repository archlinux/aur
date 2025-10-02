# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=embed
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Extra Recipes for Encoding Predictors"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-glue
  r-dplyr
  r-generics
  r-lifecycle
  r-purrr
  r-rlang
  r-rsample
  r-stats
  r-tibble
  r-tidyr
  r-utils
  r-uwot
  r-withr
  r-vctrs
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-dials
  r-ggplot2
  r-hardhat
  r-irlba
  r-keras
  r-knitr
  r-lme4
  r-modeldata
  r-rmarkdown
  r-rpart
  r-rstanarm
  r-stringdist
  r-tensorflow
  r-testthat
  r-VBsparsePCA
  r-xgboost
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('07bb64a22a8462aa91f85c45f275fdd0')
b2sums=('ffc1ab0ce9b8bb94c5ae9573d9c6b63c2e6148451a34f437634bf9866232a8b4819f2b9a5c329821b3f759885b1b16f19f2aba435154efe692df295a9b4e4d3c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
