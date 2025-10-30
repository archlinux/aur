# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEqMS
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='a tool to perform statistical analysis of differential protein expression for quantitative proteomics data.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-dplyr
  r-ggplot2
  r-limma
  r-matrixstats
)
optdepends=(
  r-biocstyle
  r-experimenthub
  r-farms
  r-ggrepel
  r-knitr
  r-lsd
  r-markdown
  r-plyr
  r-reshape2
  r-rmarkdown
  r-utils
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6e61ddbeb71483640037a2294d8ac9ed1fe5eb5636a5631d64127dff34a48f6e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
