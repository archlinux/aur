# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=doubletrouble
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification and classification of duplicated genes"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-biostrings
  r-genomicranges
  r-ggplot2
  r-mclust
  r-msa2dist
  r-syntenet
)
optdepends=(
  r-biocstyle
  r-covr
  r-feature
  r-knitr
  r-rmarkdown
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bcc083f6086186e6e1ba7d7865485cc1')
sha256sums=('70c54571be41e023d57392c762ebfa4e3dd223e6f88f22f079e3f6c251f5445f')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
