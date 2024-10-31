# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BG2
_pkgver=1.6.0
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
md5sums=('6a60a5d3010345c4b5559006b403c640')
b2sums=('7d59155de904c312aba88787f2d43d622843147e261fd112e5e6add4df7c222c85fbf9d276739eacf73bf3d7b43b75d6a68d7075e59f8ff2534869df3ee65da7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
