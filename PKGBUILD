# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BG2
_pkgver=1.14.0
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
md5sums=('da3a2fe7946807b7e6a8531e41453695')
b2sums=('284403677fb2af9821715a42a43a0995cc3331ab9f1e881735df7d866d4a158aa43e9221650417de7c88c330aebc7be5956900ea27f472962aa7b8cc9c95af38')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
