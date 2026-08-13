# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OrganismDbi
_pkgver=1.54.0
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
  r-seqinfo
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-biomart
  r-bsgenome.hsapiens.ucsc.hg19
  r-fdb.ucsc.trnas
  r-genomeinfodbdata
  r-homo.sapiens
  r-knitr
  r-rattus.norvegicus
  r-rmariadb
  r-rtracklayer
  r-runit
  r-txdbmaker
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('12819856cfba802a85768635f4d51346')
b2sums=('c126cf663961b712de50e8f9f492416b5f79f57c4db47f9703c1ffbc2aca070a323ed1718d7685fd3df190f9aca50acb666a3508ee3fc2d146f1694dfccf9b5e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
