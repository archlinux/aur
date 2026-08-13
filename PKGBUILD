# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=recoup
_pkgver=1.40.0
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
  r-seqinfo
  r-stringr
  r-txdbmaker
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-bsgenome
  r-genomeinfodb
  r-knitr
  r-rmarkdown
  r-rmysql
  r-runit
  r-zoo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('21fad17fb247a8c3af890dab6076a589')
b2sums=('c8d309ddd111080ec039e4af4b7037bab091506034afb5de1e3a0faa7b566e98dd3e18a2c85ae42d616404276a7c867b76d3177e8985fcf029caaea33ab062df')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
