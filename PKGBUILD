# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSVA
_pkgver=1.48.1
pkgname=r-${_pkgname,,}
pkgver=1.48.1
pkgrel=1
pkgdesc='Gene Set Variation Analysis for microarray and RNA-seq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocparallel
  r-biocsingular
  r-delayedarray
  r-delayedmatrixstats
  r-gseabase
  r-hdf5array
  r-iranges
  r-s4vectors
  r-singlecellexperiment
  r-sparsematrixstats
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-data.table
  r-edger
  r-future
  r-genefilter
  r-ggplot2
  r-gsvadata
  r-knitr
  r-limma
  r-org.hs.eg.db
  r-plotly
  r-promises
  r-rcolorbrewer
  r-rmarkdown
  r-runit
  r-shiny
  r-shinybusy
  r-shinydashboard
  r-shinyjs
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7b8c19225cb38c24dfebd1294918950b64108f7d4e9c2b7bee3c9a4b1eb289a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
