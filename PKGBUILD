# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=tune
_pkgver=1.2.1
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
  r-dofuture
  r-dplyr
  r-foreach
  r-future
  r-generics
  r-ggplot2
  r-glue
  r-gpfit
  r-hardhat
  r-lifecycle
  r-parsnip
  r-purrr
  r-recipes
  r-rlang
  r-rsample
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
md5sums=('1046ed825d2d365f80df947317004353')
b2sums=('bafac18fbb0118f02167cb5b98a9691e2fadd6d72dd38f4c5ec7a832678d72856446a29a9e99a434b7e1780808cf18a754b11971eb71a3404f6131dab68c2e37')

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
