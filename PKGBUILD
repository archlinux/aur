# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=recoup
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for the creation of complex genomic profile plots"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-biocgenerics
  r-biomart
  r-biostrings
  r-circlize
  r-complexheatmap
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-httr
  r-iranges
  r-rsamtools
  r-rsqlite
  r-rtracklayer
  r-s4vectors
  r-stringr
  r-txdbmaker
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-bsgenome
  r-knitr
  r-rmarkdown
  r-rmysql
  r-runit
  r-zoo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e706ef9dc0be3a41f2ebf9c6ef0cde4b')
b2sums=('14f9058a84c22ba8036c9a362cea3d2b6526b55a2e1bc00d2ccbf18144dd83312875371197a70588cc0a9c90c8ac0a5aab49bacc6385a91127b9e166ca6af551')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
