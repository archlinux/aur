# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=keras3
_pkgver=1.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="R interface to Keras"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-generics
  r-reticulate
  r-tensorflow
  r-tfruns
  r-magrittr
  r-zeallot
  r-fastmap
  r-glue
  r-cli
  r-rlang
  r-dotty
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-ggplot2
  r-testthat
  r-knitr
  r-rmarkdown
  r-callr
  r-tfdatasets
  r-withr
  r-png
  r-jsonlite
  r-purrr
  r-rstudioapi
  r-r6
  r-jpeg
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('641b89f3d78dd010d4d02617aa06eafd')
b2sums=('2ca006977147b3d6e8418f2322b55c34b4131ba08f23e01b0913c99a738c73549b15fa1c43fca205f58fe2d6fe31c94e7db477d44c48c181e66b0f80638c38bf')

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
