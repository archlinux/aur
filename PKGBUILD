# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=tune
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Tidy tuning tools"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-cli
  r-dials
  r-dplyr
  r-generics
  r-ggplot2
  r-glue
  r-gpfit
  r-hardhat
  r-parsnip
  r-purrr
  r-recipes
  r-rlang
  r-rsample
  r-tailor
  r-tibble
  r-tidyr
  r-tidyselect
  r-vctrs
  r-withr
  r-workflows
  r-yardstick
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-c50
  r-censored
  r-covr
  r-kernlab
  r-kknn
  r-knitr
  r-modeldata
  r-scales
  r-spelling
  r-testthat
  r-xgboost
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('152b86d78f4fb0aee2ba727e34d11157')
b2sums=('332afd311837cceeb01e2bbcf17c32ea7c5a6f17bccaf5b4401ee01cd2de0533885ba6369a60503a133d962fa60c14541a6fdc95e44a620b84eccc4bc4a2768d')

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
