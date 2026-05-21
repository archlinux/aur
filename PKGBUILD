# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oposSOM
_pkgver=2.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Comprehensive analysis of transcriptome data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  onetbb
  r-ape
  r-biobase
  r-biomart
  r-fastica
  r-fdrtool
  r-graph
  r-igraph
  r-pixmap
  r-png
  r-rcpp
  r-rcppparallel
  r-rcurl
  r-scatterplot3d
  r-tsne
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('448fc707020ebd9313ab16d5dc30a739')
b2sums=('6c4c59b77641765e100ced5f3cfc71533f86cd58fa434caa09156f5d577cf52e82074f8d196fede38cb4ccce6ed2e89f51eb8f7104297bae3fd90cf9e1efdbc5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
