# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IntEREst
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Intron-Exon Retention Estimator"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-dbi
  r-deseq2
  r-dexseq
  r-edger
  r-genomicalignments
  r-genomicfeatures
  r-genomicfiles
  r-genomicranges
  r-iranges
  r-rmariadb
  r-rsamtools
  r-s4vectors
  r-seqinr
  r-seqlogo
  r-summarizedexperiment
  r-txdbmaker
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-clinfun
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e7bde0f67566db81b8b1dbe3571153a2')
b2sums=('1eca13714f4809f89229e6bbcfb41a04dcf120cc9eecbcea77b0518cce3ad4ececad7db2636f544bc825f03c8a22b7be47dd5f6cf8d8f29bc8c9446564a37471')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
