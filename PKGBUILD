# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tximport
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Import and summarize transcript-level estimates for transcript- and gene-level analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-arrow
  r-deseq2
  r-edger
  r-eds
  r-jsonlite
  r-knitr
  r-limma
  r-matrixstats
  r-readr
  r-rhdf5
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-tximportdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4219dab896807630d08a2bef56086170')
b2sums=('9dcfeaa2f06d8f4eae73a3593b2906d176fa98421d9f16bf956ecafc4d364d918728871d58167d4312c5b64b67fdca8046efa4b09a45a479d84beec4cb775b97')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
