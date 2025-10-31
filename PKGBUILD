# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BG2
_pkgver=1.10.0
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
md5sums=('ce53e5c51ae65c0a155f5938bf2076f6')
b2sums=('f0e304e481b19e6140090668d1e704a36f2422906e88cb7e5ffdc62f4c53a6dfc34a01ee0e5b4073a23227d9e9e6103c92b50126c11f7e06d80791bae73742a1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
