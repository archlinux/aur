# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hiReadsProcessor
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions to process LM-PCR reads from 454/Illumina data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-dplyr
  r-genomicalignments
  r-genomicranges
  r-hiannotator
  r-pwalign
  r-readxl
  r-soniclength
)
optdepends=(
  r-knitr
  r-markdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('22b33caeea7327e179b405755d2ca50a')
b2sums=('4a164a7fb4e693cceac9b267ea9d771fafcb02f22a0c93f12a937e69de2bf9a8548ce318852410487c34ce036467d49d9875225ff9a11181688e86eabd04423d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
