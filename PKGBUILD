# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=FuseSOM
_pkgver=1.10.0
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
md5sums=('3155b95a89e4294a23ad6878a0701ed9')
b2sums=('46c70e8a323c5451fbc8aa6ba5cc79d9c9f23f74ac3ccbcc6376c37104a5ce3fcdc81b9da993da0a4b92aef6dd60a67566190e2a4ffa1abe56f697014f82eb3f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
