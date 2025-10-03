# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=modeltime
_pkgver=1.3.2
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
  r-tidymodels
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
md5sums=('08b08a57c1663ae1fc4c294412be781f')
b2sums=('169a6ab1c68b926226a4971f3be45892e5bd58c5e621f0ab7a6fa6cd06e288b8114993e860ac2f202bcff58b1b0ee5eca0b6ae4b867ab43be9f5fab388627c93')

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
