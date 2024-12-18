# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RiboDiPA
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Differential pattern analysis for Ribo-seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-or-later')
depends=(
  r-biocfilecache
  r-biocgenerics
  r-data.table
  r-deseq2
  r-doparallel
  r-elitism
  r-foreach
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-iranges
  r-matrixstats
  r-qvalue
  r-rcpp
  r-reldist
  r-rsamtools
  r-s4vectors
  r-txdbmaker
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a3bd7b10e416c2f5cdb84fb5e1ba51d8')
b2sums=('24e655933abb06b1c8ebe0416f5e65067c9673ce9157c11e15343f81f7076007dd102fb146528735bb36c6cbc413a6d60673ac8a0e3597f46e54c2a229457468')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
