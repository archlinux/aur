# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnbc
_pkgver=1.30.0
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
  r-genomeinfodb
  r-genomicranges
  r-hicbricks
  r-iranges
  r-matrixstats
  r-preprocesscore
  r-rcpp
  r-rhdf5
  r-s4vectors
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
md5sums=('05f0e008c4b32662fb1bd793ddd86bc4')
b2sums=('0642aec30eee7a0aed0940bcfe689e647983e42902795ad8ed7e96a144946abda02d764e9f89a23f38747ff04c525f730bd78d4ec91bd10ef499b4fca4c3c75c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
