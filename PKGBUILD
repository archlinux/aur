# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

_pkgname=AnnotationDbi
_pkgver=1.64.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('965300db0b7a8b527ed3eb00fdd6d10f')
b2sums=('757d5ce94d6f18df4e7a4334fc3cee2b35328b51334d8bbc9c78a5ac68d3accb0621ed6178d4469a15384df32682eb53d5caca0be99dde5c5dbeab950688f06a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
