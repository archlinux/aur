# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=doubletrouble
_pkgver=1.4.3
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
md5sums=('d31efd0013a95b9030ce7dd75cac14ed')
b2sums=('848842d5938a90eb5ea6dbd8140a2508a746f05fa11971dc008aaa2a37b38f661cf25b8444eefd07afe950b374dc2668134f006700ce709af3e93b82716e341d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
