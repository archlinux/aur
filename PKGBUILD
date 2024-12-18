# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ribosomeProfilingQC
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ribosome Profiling Quality Control"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-annotationdbi
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-edaseq
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggextra
  r-ggfittext
  r-ggplot2
  r-ggrepel
  r-iranges
  r-motifstack
  r-rsamtools
  r-rsubread
  r-rtracklayer
  r-ruvseq
  r-s4vectors
  r-scales
  r-txdbmaker
  r-xvector
)
optdepends=(
  r-ashr
  r-biobase
  r-biocstyle
  r-bsgenome.drerio.ucsc.danrer10
  r-deseq2
  r-edger
  r-knitr
  r-limma
  r-rmarkdown
  r-runit
  r-testthat
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a3c34fd8292aea1d9c4e2c2e02a04cb1')
b2sums=('90208bed1cc7cffba571dab8b614ebc54dc97be91d1dcd7516c41b45d9d65ced8ca52a080d86f4897f9382dca0e7065b3df17b1306a555fd593a817db7321ee3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
