# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=doubletrouble
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification and classification of duplicated genes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-annotationdbi
  r-biostrings
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-mclust
  r-msa2dist
  r-rlang
  r-syntenet
)
optdepends=(
  r-biocstyle
  r-covr
  r-feature
  r-knitr
  r-patchwork
  r-rmarkdown
  r-sessioninfo
  r-testthat
  r-txdbmaker
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f2ada0824b8efff20dba0ef7bc4a765f')
b2sums=('7875d57de8d941197ee55d58c708e601ea5f6f5f3c1420345a37af8eaa195d32943e5c1be1663e9c00f0e5fad2b4409b2f2c813f159bb8f317ba8e6cbe77ddd4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
