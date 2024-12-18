# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OrganismDbi
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Software to enable the smooth interfacing of different database packages"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biocmanager
  r-dbi
  r-genomicfeatures
  r-genomicranges
  r-graph
  r-iranges
  r-rbgl
  r-s4vectors
  r-txdbmaker
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-biomart
  r-bsgenome.hsapiens.ucsc.hg19
  r-fdb.ucsc.trnas
  r-homo.sapiens
  r-knitr
  r-mirbase.db
  r-rattus.norvegicus
  r-rmariadb
  r-rtracklayer
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b9af4a5f4ce821aa7b62511b9c28f08f')
b2sums=('1bb1f2e6c2d3595a750251745c12f4feea63d29d10bbd265cf641786349019ab1180e24b61909f2224159845529c9809bd3f824c42c5d7a9cd99c1097159d0f5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
