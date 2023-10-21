# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=doubletrouble
_pkgver=1.0.0
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
md5sums=('3900ef117b25b1aad217a9953deb4a46')
sha256sums=('2d4cffa1e24b43267a1fe46e7942f9092c05ba18438573721cdb2076dcd30271')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
