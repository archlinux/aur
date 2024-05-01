# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CytoGLMM
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('ea30b27117bddede77393409b40a4c189eb1054797b45c496f6ea45e4fbad9b5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
