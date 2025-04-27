# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ribosomeProfilingQC
_pkgver=1.20.0
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
md5sums=('98e5bedff9a678ef491fa04157579870')
b2sums=('75102d41c79cb1eb5ed8317e3b5e9bbcde729392b210c3d1605a3f7d413cd63ad8326056c0c5fa51c4b0c535089ce3542559cfd16513b5c5c3eedaf1a92395e0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
