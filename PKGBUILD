# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=discrim
_pkgver=1.1.0
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
md5sums=('c3653bb983cba7520b6e75c319309789')
b2sums=('47874cd40aeba688dfc7c567178ba8813cfcd359590822c599bcd333281a1b54fdf6f7b165e9bba6c4cbb2431e6d0cdac36594b573290408e41797e536e4bcd6')

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
