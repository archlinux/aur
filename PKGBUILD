# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

_pkgname=AnnotationDbi
_pkgver=1.68.0
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
md5sums=('0f0e70eecd93f528f954d8d9fb4c8a8e')
b2sums=('49f40beca02b3d6a679fb2b830d743c44bb5ebfa08592fcee6b1143033c9093f96ce4ab302f5249f57f0997cf5060ee456db2fa7cf6aff73604bd6e1fadec3c0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
