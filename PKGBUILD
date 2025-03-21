# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MAGAR
_pkgver=1.14.0
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
md5sums=('a54d3ada0dda135fabf355780623abe0')
b2sums=('5b929ec4754187fa9273949ee0c6300098de9e80c90e0fd1900108e39fb50fd7fd082c0b7004bf2b585331e42956d01b54bcc6fdf1cefdf7e1639903bb35b636')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
