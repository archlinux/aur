# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=modeltime
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="The Tidymodels Extension for Time Series Modeling"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-dials
  r-dplyr
  r-doparallel
  r-forcats
  r-foreach
  r-ggplot2
  r-glue
  r-gt
  r-hardhat
  r-janitor
  r-magrittr
  r-methods
  r-parallel
  r-parallelly
  r-parsnip
  r-plotly
  r-purrr
  r-prophet
  r-reactable
  r-rlang
  r-scales
  r-stanheaders
  r-stringr
  r-tibble
  r-tidyr
  r-timetk
  r-workflows
  r-xgboost
  r-yardstick
  r-tidymodels
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-earth
  r-kernlab
  r-knitr
  r-glmnet
  r-greybox
  r-lubridate
  r-qpdf
  r-randomforest
  r-recipes
  r-rmarkdown
  r-rsample
  r-rstan
  r-slider
  r-sparklyr
  r-smooth
  r-testthat
  r-thief
  r-trelliscopejs
  r-tsrepr
  r-tune
  r-webshot
  r-workplowsets
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e855d2cb172d746f470878b26caa0fcc')
b2sums=('54f65c5d323e66e52efd34ea0d5d59f03e3041bdd1214cce39a687d60dc48aaccc5c5c2f996c3250e128bc18272ee576929070a41146717928f1ae9d5aab1532')

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
