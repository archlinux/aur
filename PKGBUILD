# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PhyloProfile
_pkgver=2.4.7
pkgname=r-${_pkgname,,}
pkgver=2.4.7
pkgrel=1
pkgdesc='PhyloProfile'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-ape
  r-biocstyle
  r-biodist
  r-biostrings
  r-bit64
  r-bsplus
  r-colourpicker
  r-data.table
  r-dplyr
  r-dt
  r-energy
  r-fastcluster
  r-ggplot2
  r-gridextra
  r-htmlwidgets
  r-pbapply
  r-plotly
  r-rcolorbrewer
  r-rcurl
  r-scattermore
  r-shiny
  r-shinycssloaders
  r-shinyfiles
  r-shinyjs
  r-stringr
  r-svglite
  r-tsne
  r-umap
  r-xml2
  r-yaml
  r-zoo
)
optdepends=(
  r-knitr
  r-omadb
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9fbae75196564cdebd77e45669d6c4b4e1464ae33a2401396472188de1ddbf7a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
