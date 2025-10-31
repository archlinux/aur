# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rBiopaxParser
_pkgver=2.50.0
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
md5sums=('f0e40da309f8599cade2496fe15c489d')
b2sums=('47457cd8aa6e6f78bcd50e6ea5c1d9a41440ad1da91b5d20dd127ddb6b116ba831c53bb3ca84c88b4fb9dac093a208b4cad81ffed9a8aa68f024baa637fda073')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
