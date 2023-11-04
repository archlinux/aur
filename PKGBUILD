# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

_pkgname=AnnotationDbi
_pkgver=1.64.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('965300db0b7a8b527ed3eb00fdd6d10f')
sha256sums=('03bff46268ad797466f445c51ab72929224514512561c43662037ca10618b9ad')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
