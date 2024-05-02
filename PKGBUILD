# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=FuseSOM
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Correlation Based Multiview Self Organizing Maps Clustering For IMC Datasets"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-analogue
  r-coop
  r-diptest
  r-fastcluster
  r-fcps
  r-fpc
  r-ggplot2
  r-ggplotify
  r-ggpubr
  r-pheatmap
  r-proxy
  r-psych
  r-s4vectors
  r-stringr
  r-summarizedexperiment
)
makedepends=(
  r-rcpp
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-singlecellexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f73bd6a1428a7e6a477bd5b0624ab436')
b2sums=('59a20a451a29793f50698d932901dfecfb989a3569b8e60e7f1c0ee23efec3d0ad6f16bdb5087b3b68492a5f75f1edbaab28296ce546086d4f6a087b5510f8b5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
