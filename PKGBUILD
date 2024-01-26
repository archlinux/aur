# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=doubletrouble
_pkgver=1.2.3
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
  r-rmarkdown
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('254b85e757da32c48112ef3bbd05c605')
b2sums=('cebe284c80e86f1899656f4373d7faedc79d1ddfba92da0ce8215d07556a67a8668b13883d69e7aff5caf3b9e2709d8219af06b3143cf3ab3c9e224f0f91243d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
