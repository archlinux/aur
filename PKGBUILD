# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=workflowsets
_pkgver=1.1.1
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
md5sums=('27e0daadc2225d05adabc56b32af9a50')
b2sums=('63ec4d01c0bd556477759e9070787eca9223598f3c3d03934863066cc339d63a7f77b707cd6a15c8e12ccdad554e714fe0983be53843faa53ec5704c370d31e1')

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
