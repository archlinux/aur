# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=recoup
_pkgver=1.36.0
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
md5sums=('df4105d40be95411e71577daa9c0a7e8')
b2sums=('51df306468ace612be42c9eceaf0b9246f99d60f2af2346bebfab07cf094618fcebdc0a1474acf32e3dfb253841aefdb2bd47ca93cd4c54912b6632d1a5a3c09')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
