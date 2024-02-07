# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=doubletrouble
_pkgver=1.2.5
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
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('58b33ed625e84743150590ce3a524cc7')
b2sums=('fd8bb229e0aaf4bcffa4860d8e89efe141fcc40d368e96f59d5b77c831b38279de89b84448792888f5bc4b4c35117951c58dc80fcc5f0bd2b811f36e149e279e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
