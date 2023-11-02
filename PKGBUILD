# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=drugTargetInteractions
_pkgver=1.10.1
pkgname=r-${_pkgname,,}
pkgver=1.10.1
pkgrel=1
pkgdesc='Drug-Target Interactions'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationfilter
  r-biocfilecache
  r-biomart
  r-dplyr
  r-ensembldb
  r-rappdirs
  r-rsqlite
  r-s4vectors
  r-uniprot.ws
)
optdepends=(
  r-biocstyle
  r-dt
  r-ensdb.hsapiens.v86
  r-ggplot2
  r-knitr
  r-reshape2
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5aa4b61ef391d2e907557b363b3fe41a0e9b0203459b299ffcb89e247649af0c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
