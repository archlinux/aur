# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NCIgraph
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Pathways from the NCI Pathways Database"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-graph
  r-kegggraph
  r-r.oo
  r-rbgl
  r-rcy3
)
optdepends=(
  r-rgraphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ed568ded26dce9e64d5f38606e65c13d')
b2sums=('9dbd131ba314a900ce7bb8c10155ad5fc25e0dc0c0c622ab03b06e62e83f25f2f947b96f319a215046fe7b458396dbe2f9f06fab842be44bc2542f1e1484c2f3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
