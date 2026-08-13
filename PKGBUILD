# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=FuseSOM
_pkgver=1.14.0
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
md5sums=('113fef0579fe37a493526b9f34b7564e')
b2sums=('da9f68190146403b309690021051fc34b0a3f1d6a0c17c22437113304b40cd2325286f789ca4a6bd9348156c86c84b62a5d054f0297d93a9aeb3d5fcd4faeb98')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
