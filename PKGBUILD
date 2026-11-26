# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=FuseSOM
_pkgver=1.16.0
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
md5sums=('e8e9ffb858d9aeb5a46b1ac43f46cf87')
b2sums=('91c3ea4f71467762502dff687ac44949d3603053647e1533cc0b6c95b1c8d626a55423ad78a37e26e61474c50a5344f686224805c06f9579d4f7e0ecb7e298fa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
