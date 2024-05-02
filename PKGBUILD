# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BG2
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Performs Bayesian GWAS analysis for non-Gaussian data using BG2"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-caret
  r-ga
  r-memoise
)
optdepends=(
  r-biocstyle
  r-formatr
  r-knitr
  r-rmarkdown
  r-rrblup
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fc5526287f3780e3cfa562d9f4b288d4')
b2sums=('9075f31a2e613e238f911129880d9ee1d83307a88a19db70d5a385ae55dfcc2d5b950d6dd9a911786e858a4561d1d4b94d96f4bc4cd55f476c882a31b2e70a67')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
