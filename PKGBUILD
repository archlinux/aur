# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dnet
_pkgver=1.1.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Integrative Analysis of Omics Data in Terms of Network, Evolution and Ontology"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-graph
  r-igraph
  r-rgraphviz
  r-suprahex
)
optdepends=(
  r-biobase
  r-doparallel
  r-foreach
  r-limma
)
source=("https://cran.r-project.org/src/contrib/Archive/$_pkgname/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0a42f86fab2e9288eb4ebfcaa0e94d13')
b2sums=('804eb4f2f409a438bc772b1f3ee7fb9ceaedbc642cbcb92bd1c41404adb47cce7ea6dc84b369ed1c7dbf4ba63263d8f58be4a585b0c2f04d56fbf561bd52dfc1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
