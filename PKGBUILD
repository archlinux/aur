# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=openPrimeR
_pkgver=1.29.0
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
md5sums=('14375d1dd4c8ddafdf2775398c0e254b')
b2sums=('be6404b848e1e71385b199874aae398b4031a8cd23e1daa916c79d83b488b0d2e37484b021b384ca4bbe76de8e73292f07f905c4df701c2e12841752ef0175f9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
