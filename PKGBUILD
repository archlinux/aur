# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phemd
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f2f4325b02cd7c6b4c96b69de58ec50a')
sha256sums=('e280bcc6af6de22930bc8403dc9b9b3fd36af8834ec1dd653bcd07732d04b2bd')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
