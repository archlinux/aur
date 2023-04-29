# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyepico
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='ShinyÉPICo'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-data.table
  r-doparallel
  r-dplyr
  r-dt
  r-foreach
  r-genomicranges
  r-ggplot2
  r-gplots
  r-heatmaply
  r-limma
  r-minfi
  r-plotly
  r-reshape2
  r-rlang
  r-rmarkdown
  r-rtracklayer
  r-shiny
  r-shinycssloaders
  r-shinyjs
  r-shinythemes
  r-shinywidgets
  r-statmod
  r-tidyr
  r-zip
)
optdepends=(
  r-biocstyle
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylation450kmanifest
  r-illuminahumanmethylationepicanno.ilm10b4.hg19
  r-illuminahumanmethylationepicmanifest
  r-knitr
  r-mcsea
  r-minfidata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e16321def5699f367b5bf02b9a9f4fc583488c79c0458aae8e0bd0a4dbd83f39')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
