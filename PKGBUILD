# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MAGAR
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='MAGAR: R-package to compute methylation Quantitative Trait Loci (methQTL) from DNA methylation and genotyping data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
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
sha256sums=('ba32845894424388558fc9e5db7d6c199e656b79abc7ad89db7fed399f6063fa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
