# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BgeeCall
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Automatic RNA-Seq present/absent gene expression calls generation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biomart
  r-biostrings
  r-data.table
  r-dplyr
  r-genomicfeatures
  r-jsonlite
  r-rhdf5
  r-rslurm
  r-rtracklayer
  r-sjmisc
  r-txdbmaker
  r-tximport
)
optdepends=(
  r-annotationhub
  r-httr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a1170835d1eaa6144bd8b55ecb2110ad')
b2sums=('7b68f0ad1c30e9c8b4a1a31632d642812d81afb7c00529b86779a4ca6d67c84657b4e72bc6361f0a09df806ce6c3bc5d3f3487010d3c460a8d039979c2c4e969')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
