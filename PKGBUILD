# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnbc
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bandwise normalization and batch correction of Hi-C data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-data.table
  r-ebimage
  r-genomicranges
  r-iranges
  r-matrixstats
  r-preprocesscore
  r-rcpp
  r-rhdf5
  r-s4vectors
  r-seqinfo
  r-summarizedexperiment
  r-sva
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2b02c62a3fd57c5a7a93ee27b9a7f6e7')
b2sums=('7b35231752c99bea8773bca93840d3062fc126ea067d1057abb7288b6b420d3cfdd110a23e460a801a101d5f8d163cf2c30071791d51cf3fd1b6ecd0bcf06a63')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
