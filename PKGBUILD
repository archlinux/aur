# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NCIgraph
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('0c7208ea1426654ba940fa38ad261a06')
b2sums=('8ac181cdb6a6aab939fe53e23b37a30ce926d28c470dfde9c3515f4ef2039e36f3e75c49aad8881cb61d1ce396609947d96316ef9af3238bf049282534e82c07')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
