# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSVA
_pkgver=2.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene Set Variation Analysis for Microarray and RNA-Seq Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
  r-biocparallel
  r-biocsingular
  r-cli
  r-delayedarray
  r-delayedmatrixstats
  r-gseabase
  r-hdf5array
  r-iranges
  r-s4vectors
  r-singlecellexperiment
  r-sparsematrixstats
  r-spatialexperiment
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
md5sums=('8eac1dd2f0cf89b0bd74b8c86d233d31')
b2sums=('fe78beffd15454d91ef3aa8c1ebd5c329b803d6367e62746b4a900d3a5f964f6aa23ceba1d188add6130891d85fb84bc9da0255b90428b9e68deabbccfa9b5c1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
