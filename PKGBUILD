# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OrganismDbi
_pkgver=1.46.0
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
md5sums=('a81aa484401a0794b889eb66ba462cdc')
b2sums=('6b5a48844b244700a81531091902eaac87ec5504eb90852b84e407ec213442ef97e6e3eff5786e27ab994cb245a87e30f51d402af15755158375896af95fdf10')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
