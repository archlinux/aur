# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ribosomeProfilingQC
_pkgver=1.24.0
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
  r-seqinfo
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
  r-genomeinfodbdata
  r-knitr
  r-limma
  r-rmarkdown
  r-runit
  r-testthat
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b83739cb7f05c317a8bb6d386a2fa2e1')
b2sums=('3dbafb7258ef62023e4e74c6270d0f6b72c4de0cd0d7aea5e188be050d59e7a736a4901468eeda28771246b1109d59d2f0e3da248fe379d5c1bcd8cf149581f0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
