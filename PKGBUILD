# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ribosomeProfilingQC
_pkgver=1.16.0
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
md5sums=('d633d56b98baef25b32f80e354eb9e8f')
b2sums=('e2e0d0c504111989bb2805be01036f84f7e83c7bb8648d8b611822a4de69313d5c3cb6a0a9d8c794877c5bb2ad80589d32834fb3b9f6d3f777d1c8fbfb5d6b9b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
