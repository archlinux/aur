# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MAGAR
_pkgver=1.16.0
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
md5sums=('5bbea1d6b1f144b9ce4d4a3c9ca37eaa')
b2sums=('0c8a858a04d1660bdc48c5234365a624e2d1a163baf36c96013f67c97f06c3f0e0d4aee461a44a66c999d323e101bf72b06890980ad0de7dd1c201f2941577fb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
