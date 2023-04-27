# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RiboDiPA
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Differential pattern analysis for Ribo-seq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biocfilecache
  r-biocgenerics
  r-data.table
  r-deseq2
  r-doparallel
  r-elitism
  r-foreach
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-iranges
  r-matrixstats
  r-qvalue
  r-rcpp
  r-reldist
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c1967fcaa0bed5fc06c0c865373895218d3b28e018a261f2d9fdda011bd97c90')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
