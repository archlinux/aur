# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CytoGLMM
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Conditional Differential Analysis for Flow and Mass Cytometry Experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biocparallel
  r-caret
  r-cowplot
  r-doparallel
  r-dplyr
  r-factoextra
  r-flexmix
  r-ggplot2
  r-ggrepel
  r-logging
  r-magrittr
  r-mbest
  r-pheatmap
  r-rcolorbrewer
  r-rlang
  r-stringr
  r-strucchange
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2ee4f2b31b1549068304602dfd07f325ef12fa0bdd4ff87c395e9dd30ae9845b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
