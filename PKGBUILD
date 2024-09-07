# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=workflowsets
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Create a collection of 'tidymodels' workflows"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-cli
  r-dplyr
  r-generics
  r-ggplot2
  r-glue
  r-hardhat
  r-lifecycle
  r-parsnip
  r-pillar
  r-prettyunits
  r-purrr
  r-rlang
  r-rsample
  r-tibble
  r-tidyr
  r-tune
  r-vctrs
  r-withr
  r-workflows
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-dials
  r-finetune
  r-kknn
  r-knitr
  r-modeldata
  r-recipes
  r-rmarkdown
  r-spelling
  r-testthat
  r-tidyclust
  r-yardstick
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7b34448c75c79c386e702a3e0ea1385b')
b2sums=('b240c14384e38c9db783bf33682aaea1cd0b034920a6c1c71370da8c7d3a830732ffd2a5e67330e41e5d4d58bb3506813dd09eef013635a7e21d74edcc66d814')

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
