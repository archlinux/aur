# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MQmetrics
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Quality Control of Protemics Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cowplot
  r-dplyr
  r-ggforce
  r-gghalves
  r-ggplot2
  r-ggpubr
  r-ggrepel
  r-gridextra
  r-gtable
  r-knitr
  r-magrittr
  r-plyr
  r-purrr
  r-rcolorbrewer
  r-readr
  r-reshape2
  r-rlang
  r-rmarkdown
  r-scales
  r-stringr
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('259d70dd23165fe896a4af28d43df5215b7aad981e02633ec979cfaeb478609e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
