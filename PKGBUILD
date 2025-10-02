# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=discrim
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Model Wrappers for Discriminant Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-dials
  r-parsnip
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
md5sums=('cc10407ead0d2e9f58e081746eeba617')
b2sums=('a4ee25dd4815368ad2b33e4b5507f9681907146cdf865a1990269fe231f8b96b270e053c67e6a9012f4018ec52fe7a454b5de17fa52b9647c643c5a62b626fec')

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
