# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phemd
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Phenotypic EMD for comparison of single-cell samples"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
depends=(
  r-biobase
  r-biocgenerics
  r-cowplot
  r-destiny
  r-ggplot2
  r-igraph
  r-maptree
  r-monocle
  r-phater
  r-pheatmap
  r-pracma
  r-rann
  r-rcolorbrewer
  r-reticulate
  r-rtsne
  r-s4vectors
  r-scatterplot3d
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
  r-transport
  r-vgam
)
optdepends=(
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8cefd4ddfea1dd2deb007acb6cebfb7a')
sha256sums=('03c5354299deefdf02142f4fc7d8464aac1489a62b719f1caf026b1b8db8929c')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
