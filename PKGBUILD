# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phemd
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Phenotypic EMD for comparison of single-cell samples"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
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
b2sums=('9ab2b14464677188c80526b440aa959aedcc66868aa5deab425d4c33282647ccc9c002ff92dcfe2edba67083f7f9dcfaefad71cd0ea4e4d653dbfb6413e3d24a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
