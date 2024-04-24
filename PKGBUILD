# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tximport
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
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
md5sums=('8bbe549dafbf5b0dfe626f327910a893')
b2sums=('2020336448c1c3e6858f7f922c4e7f9748e42e58382f301a438a7effc3df0078e130248dca31a4206af2cd9245204e88cc423b4e0eb978aa922613197853dab6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
