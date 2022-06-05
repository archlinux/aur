# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=barcodetrackR
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Functions for Analyzing Cellular Barcoding Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-circlize
  r-cowplot
  r-dplyr
  r-ggdendro
  r-ggplot2
  r-ggridges
  r-magrittr
  r-plyr
  r-proxy
  r-rcolorbrewer
  r-rlang
  r-s4vectors
  r-scales
  r-shiny
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-vegan
  r-viridis
)
optdepends=(
  r-biocstyle
  r-knitr
  r-magick
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a38df756b1605abfaf00269a8ac2c284af43ce469513bcc3e05fe1377b09aa7b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
