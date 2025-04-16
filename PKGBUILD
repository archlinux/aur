# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=STRINGdb
_pkgver=2.20.0
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
md5sums=('1c9188e966b5af3cf6f68dd94313452e')
b2sums=('e5dd16b3210d5d1b11e6773d897090e9ee263bc8655a943064961a9fb0fc8ca8b1d6c6c174f5fb4657f87917268e6b2762faa2f8d24abef1fbe7ee03f0bb6c2b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
