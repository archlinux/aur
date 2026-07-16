# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scanMiR
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="scanMiR"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-biostrings
  r-cowplot
  r-data.table
  r-genomicranges
  r-ggplot2
  r-iranges
  r-pwalign
  r-s4vectors
  r-seqinfo
  r-seqlogo
  r-stringi
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('19215883bc917acc0751311863dc016f')
b2sums=('751168ed47bc67926a528a7fc5fd005bdf4a1e3ab66ad666ded9c13dfa95d0e501b11d675b7c545b852b803c1c58a81ee188d32cf911dbf7e8e0f8fe97dcc284')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
