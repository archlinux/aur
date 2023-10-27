# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cummeRbund
_pkgver=2.44.0
pkgname=r-${_pkgname,,}
pkgver=2.44.0
pkgrel=1
pkgdesc='Analysis, exploration, manipulation, and visualization of Cufflinks high-throughput sequencing data.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-fastcluster
  r-ggplot2
  r-gviz
  r-plyr
  r-reshape2
  r-rsqlite
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-cluster
  r-genomicfeatures
  r-genomicranges
  r-nmfn
  r-plyr
  r-rjson
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ba000f61445b3b4319994a621c04055900af34d17985e90b1a2ab4a7be1cbda8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
