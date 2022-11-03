# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TarSeqQC
_pkgver=1.27.0
pkgname=r-${_pkgname,,}
pkgver=1.27.0
pkgrel=1
pkgdesc='TARgeted SEQuencing Experiment Quality Control'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-cowplot
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-ggplot2
  r-hmisc
  r-iranges
  r-openxlsx
  r-plyr
  r-reshape2
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-biocmanager
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f8be56edb6e8bfc0737af18b6371d221c4bd3e38a3186b4b3c3c8626073b3b46')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
