# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASpli
_pkgver=2.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis of Alternative Splicing Using RNA-Seq"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-annotationdbi
  r-biocgenerics
  r-biocstyle
  r-data.table
  r-dt
  r-edger
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-gviz
  r-htmltools
  r-igraph
  r-iranges
  r-limma
  r-pbmcapply
  r-rsamtools
  r-s4vectors
  r-tidyr
  r-txdbmaker
  r-upsetr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4a8a46161468892eed33896cd0be8970')
b2sums=('0f12b8e34edc146f2c97a77a7317515c3e299b577c3f7b8e43776266481130e00abd7a01d3c1cba1f3c7292216402d7fd8f99d8a09e4807aceb85b3b51ba0ba1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
