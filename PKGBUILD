# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=structToolbox
_pkgver=1.12.3
pkgname=r-${_pkgname,,}
pkgver=1.12.3
pkgrel=1
pkgdesc='Data processing & analysis tools for Metabolomics and other omics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-ggthemes
  r-gridextra
  r-scales
  r-sp
  r-struct
)
optdepends=(
  r-agricolae
  r-biocfilecache
  r-biocstyle
  r-car
  r-covr
  r-cowplot
  r-e1071
  r-emmeans
  r-ggdendro
  r-knitr
  r-magick
  r-nlme
  r-openxlsx
  r-pls
  r-pmp
  r-rappdirs
  r-reshape2
  r-rmarkdown
  r-ropls
  r-rtsne
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('651d2499f7bf01e86538aa58f3b25014b9a29f90d791a059bc79932de3a70f3c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
