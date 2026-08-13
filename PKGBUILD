# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RiboDiPA
_pkgver=1.20.0
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
md5sums=('849254a451b7561dd6a47fa75c9d4d3d')
b2sums=('9f18710df86c4b41c017d9676043e871cc7ea189693976fe21d76bed0e35b3443282ea9654269e6aea6681d797814e09e5658d3b6f1070e32f4a0fe063f2cecf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
