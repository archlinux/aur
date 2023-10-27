# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TADCompare
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='TADCompare: Identification and characterization of differential TADs'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-cowplot
  r-dplyr
  r-ggplot2
  r-ggpubr
  r-hiccompare
  r-magrittr
  r-primme
  r-rcolorbrewer
  r-reshape2
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-microbenchmark
  r-pheatmap
  r-rgreat
  r-rmarkdown
  r-spectraltad
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('65d6f4a112522468f2bf21deb79df1c6fd5f49ac51b03ab149fbaf75b39b7380')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
