# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=discrim
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Model Wrappers for Discriminant Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-dials
  r-rlang
  r-stats
  r-tibble
  r-withr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-dplyr
  r-earth
  r-ggplot2
  r-glue
  r-klar
  r-knitr
  r-mass
  r-mda
  r-mlbench
  r-modeldata
  r-naivebayes
  r-rmarkdown
  r-sda
  r-sparsediscrim
  r-spelling
  r-testthat
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fe754dce7c856aa74fe16c98a9499e45')
b2sums=('c6d6be50b85f39ea25f165d6b15e66f076a7484c09d3c9035f895d59dee7468cba48654fd4aa42c6db2da2862e9d143f11cc0de9f111863ae3f1e93eeb54468e')

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
