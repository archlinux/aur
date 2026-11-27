# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=openPrimeR
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multiplex PCR Primer Design and Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-ape
  r-biocgenerics
  r-biostrings
  r-decipher
  r-digest
  r-dplyr
  r-foreach
  r-genomicranges
  r-ggplot2
  r-hmisc
  r-iranges
  r-lpsolveapi
  r-magrittr
  r-openxlsx
  r-plyr
  r-pwalign
  r-rcolorbrewer
  r-reshape2
  r-s4vectors
  r-scales
  r-seqinr
  r-stringdist
  r-stringr
  r-uniqtag
  r-xml
)
optdepends=(
  r-devtools
  r-doparallel
  r-knitr
  r-learnr
  r-pander
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('546416b607a1afe5779b2a813e56220b')
b2sums=('55f6e4709941c98095c0938ffec402ea636d6f32234f30f38d06b9691d02d655539e5b37c772515fa5bc286efdee35b292c478ae673518a783cff2ab1b9f8f78')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
