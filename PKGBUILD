# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MAGAR
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R-package to compute methylation Quantitative Trait Loci (methQTL) from DNA methylation and genotyping data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-argparse
  r-bigstatsr
  r-crlmm
  r-data.table
  r-doparallel
  r-ff
  r-hdf5array
  r-igraph
  r-impute
  r-jsonlite
  r-plyr
  r-reshape2
  r-rjson
  r-rnbeads
  r-rnbeads.hg19
  r-rnbeads.hg38
  r-snpstats
  r-upsetr
)
optdepends=(
  r-biocgenerics
  r-biocmanager
  r-devtools
  r-gridextra
  r-jaspar2018
  r-knitr
  r-lola
  r-qqman
  r-rmarkdown
  r-rmutil
  r-runit
  r-seqlogo
  r-tfbstools
  r-venndiagram
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('68a9f4deaeb5dbb88937ce6a9051d82d')
b2sums=('85bb310e3617188e492e8d62d3f92e6fc774af7e106c84c40201d07137cac70fe98cf1741b8a30d4185340c705ef4c7139860d3a75750aa4c2a31b48912d68b4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
