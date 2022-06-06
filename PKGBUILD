# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=erccdashboard
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Assess Differential Gene Expression Experiments with ERCC Controls'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-edger
  r-ggplot2
  r-gplots
  r-gridextra
  r-gtools
  r-limma
  r-locfit
  r-plyr
  r-qvalue
  r-reshape2
  r-rocr
  r-scales
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('00c566cd287e273c3d53836fd6f839678c08539722e1ab1798ef27c9c8b8ddda')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
