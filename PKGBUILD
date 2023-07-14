# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

_pkgname=AnnotationDbi
_pkgver=1.62.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Manipulation of SQLite-based annotations in Bioconductor"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('e12679a9cb4533c5f24fc27458b8d8e6')
sha256sums=('893743dafad619a9742e67944b8b8df5431b967fc3edf4e6b4eea63309aaf96e')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
