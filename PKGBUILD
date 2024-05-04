# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=openPrimeR
_pkgver=1.26.0
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
md5sums=('3e0311e1cbc408d29c99c0caf12cff31')
b2sums=('e207a7e9f278723676fe0bc707017977f54f30d0e45b14b3ab31924aca5cf457dbf37dc713ee4c7b16ea574fdc5b0d45a5e0423c95bffd08b54e08bdc5723363')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
