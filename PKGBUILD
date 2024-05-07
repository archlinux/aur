# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hiReadsProcessor
_pkgver=1.40.0
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
md5sums=('a77515300961f592ea26eb818b1b6a32')
b2sums=('86c4fde4bee6e9fa5b2b5f349d38a53de47ef1c6172ee9030ca0ae03dc0a8303e7e3d5ae0140d9b53ab2cd423af6e0113f52b63a9b86aa6196950c58bea10906')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
