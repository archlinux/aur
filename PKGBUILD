# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HIPPO
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Heterogeneity-Induced Pre-Processing tOol'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-irlba
  r-magrittr
  r-reshape2
  r-rlang
  r-rtsne
  r-singlecellexperiment
  r-umap
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1acc1054540632f12b67f7d4a02436f990a9879660ab4b293bdf3014a5bf9d3a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
