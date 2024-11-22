# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=embed
_pkgver=1.1.4
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
md5sums=('0d44354dfc66f7eb8cb54ec09a6aabdf')
b2sums=('30ec45bc1c7c42fa77bfb9ce7d742f85c9a1f705077d6caf2955d6ac3092c65985df55c79e263dbad7ae4924c08ae3d6ebbd090ff3c1a83df9d32a1ff031fa38')

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
