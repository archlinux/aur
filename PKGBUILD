# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=doubletrouble
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification and classification of duplicated genes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-annotationdbi
  r-biocparallel
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
md5sums=('f8287b34c1bec3a4b1523411f071ff86')
b2sums=('176d71cbd633570cc90fb160511a4fe70c22c298b555024a4eb08e50ff7ed742fb8b968955702f2c441089f9f27b5c6219892979925c334bb7de1b584266eb11')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
