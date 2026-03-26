# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=embed
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Extra Recipes for Encoding Predictors"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
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
  r-vctrs
  r-withr
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
md5sums=('5b43124ade10a4334b70e6bb856ac3ae')
b2sums=('124227d72028bd85e81f5cfef65281b0b9780d4cad061e38e031270aef8629e07303024a2fdbca0ea1d3181f3d0b372472a21664d03e4a0477255bbc6b7b7a25')

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
