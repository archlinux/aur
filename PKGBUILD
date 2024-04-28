# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SGCP
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="A semi-supervised pipeline for gene clustering using self-training approach in gene co-expression networks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-annotate
  r-caret
  r-desctools
  r-dplyr
  r-expm
  r-genefilter
  r-ggplot2
  r-ggridges
  r-go.db
  r-gostats
  r-graph
  r-openxlsx
  r-org.hs.eg.db
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-rgraphviz
  r-rspectra
  r-summarizedexperiment
  r-xtable
)
optdepends=(
  r-biocmanager
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('46986c7dd18ef80a29c389500ed5023b')
b2sums=('0afa55dd87a1f112a51b633ee274c04e13870b5eae0cb3cbbcb504c02656c6a5798ee045f9c4fd19b6f0ae6130fe6db5f3f36883bc85ade94e6eb4f3e400b280')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
