# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tximeta
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Transcript Quantification Import with Automatic Metadata"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-annotationdbi
  r-annotationhub
  r-biocfilecache
  r-biostrings
  r-ensembldb
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-jsonlite
  r-s4vectors
  r-summarizedexperiment
  r-tibble
  r-txdbmaker
  r-tximport
)
optdepends=(
  r-deseq2
  r-devtools
  r-edger
  r-fishpond
  r-knitr
  r-limma
  r-org.dm.eg.db
  r-rmarkdown
  r-testthat
  r-tximportdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9649130d0f0e128654a89bf3dcb10738')
b2sums=('8802d290699616294ef3b327eb0e0429dd146f3bdcfa81df82f5afff3536179c6fad580d338a870f043a151e5cbf5ff4de4c1b14e720856adaffe0b848714178')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
