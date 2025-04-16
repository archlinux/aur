# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rBiopaxParser
_pkgver=2.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Parses BioPax files and represents them in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-data.table
  r-xml
)
optdepends=(
  r-biocgenerics
  r-graph
  r-igraph
  r-rbgl
  r-rcurl
  r-rgraphviz
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8188800a0c23b7afbfb96ed54e47d115')
b2sums=('370b9bf83946c84b35e78d15e168e359cf4459aec1169adf4a922efe52191eb371899a8d93e61a325f4c1469b0fcd4ce022f5aae566fd7171cb44c86b16a4d75')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
