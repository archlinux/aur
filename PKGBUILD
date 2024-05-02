# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=STRINGdb
_pkgver=2.16.0
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
md5sums=('4630680c3a7809dbc80594cb9c335e37')
b2sums=('a8026d882a70cfaacd410be512f9ba71c804264c9302bd5636686827e1d6dde4b4deed9b65428481cbfa4779de4612a69bc33c73a1dbc49a93bee76ac862ec10')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
