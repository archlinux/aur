# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rBiopaxParser
_pkgver=2.54.0
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
md5sums=('5f71440d4bacd515989bd0ca7d6c7a83')
b2sums=('7663e4d2fed14b955b3c5f456a3641d5056aa29dfad9f42af9fc29e4c9777d72391da97cd016b2a395992d3d8c080521cc1088555170ddc761cb711e9c4bddf5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
