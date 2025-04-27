# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RiboProfiling
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Ribosome Profiling Data Analysis: from BAM to Data Representation and Interpretation'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-data.table
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggbio
  r-ggplot2
  r-iranges
  r-plyr
  r-reshape2
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-sqldf
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-knitr
  r-summarizedexperiment
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('68c907baa107aaeadb76082b6ac2c140a0505762412b0e1d86b6637c0dc35a79')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
