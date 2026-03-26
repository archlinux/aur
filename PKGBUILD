# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=tune
_pkgver=2.0.1
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
md5sums=('4af270b28b348f89d24c9c8f5fa2c724')
b2sums=('cb2f5f5298a86f1fea01dac671ba04386e3a16b8d86d8de9a9eee4658739a765e3f26bbdd5c3ca29be0a6d3f1ef19dbd08447562d2b6de346f4d6c49c9e4604a')

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
