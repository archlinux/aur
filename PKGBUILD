# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cfDNAPro
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc='cfDNAPro Helps Characterise and Visualise Whole Genome Sequencing Data from Liquid Biopsy'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-ggplot2
  r-magrittr
  r-quantmod
  r-rlang
  r-rsamtools
  r-stringr
)
optdepends=(
  r-biocstyle
  r-devtools
  r-ggpubr
  r-knitr
  r-rmarkdown
  r-scales
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('803187b841cd8fc307c03ea63258484359a1c901dc63e8e29251504bc4b875ad')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
