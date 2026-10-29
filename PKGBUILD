# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=STRINGdb
_pkgver=2.24.2
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
md5sums=('52a16cd1ada236eee53d2cc734e341ce')
b2sums=('98ed9f2053e54b6871772cda05dad6426352fbbc9e691d10f3508e728c06219c553063506271b076e197bfffbc9b6dd5bb06245780a335bbb774f0a8c94dcda4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
