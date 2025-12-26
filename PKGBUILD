# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

_pkgname=AnnotationDbi
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Manipulation of SQLite-based annotations in Bioconductor"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
  r-biocgenerics
  r-dbi
  r-iranges
  r-keggrest
  r-rsqlite
  r-s4vectors
)
optdepends=(
  r-annotationforge
  r-biocstyle
  r-ensdb.hsapiens.v75
  r-go.db
  r-graph
  r-hgu95av2.db
  r-knitr
  r-org.at.tair.db
  r-org.hs.eg.db
  r-org.sc.sgd.db
  r-reactome.db
  r-runit
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dab5c3c6d38999d7f3d0c16dd93d1780')
b2sums=('357dc84a5d087a3babd270d061e70ffa46c4f4baada4732b35f750bde43a644a96fcad4444cd71c5d8274569bf85d248b18d467fe607674a9a3b8b3b25f25bec')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
