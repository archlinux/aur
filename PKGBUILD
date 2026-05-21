# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=STRINGdb
_pkgver=2.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Protein-Protein Interaction Networks and Functional Enrichment Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-gplots
  r-hash
  r-httr
  r-igraph
  r-plotrix
  r-plyr
  r-png
  r-rcolorbrewer
  r-sqldf
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('87476ae5f1fd80443014ec829ad7739b')
b2sums=('5e569d8af5a7cf8a29860788f386a3287e7a9b23c3561c142baf0a9717fe0ee9ae799589c6be28eef3c18b1b159edaf316dd46072432d2e9a1e4e3fd12558114')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
