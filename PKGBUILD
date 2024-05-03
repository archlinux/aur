# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSVA
_pkgver=1.52.0
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
md5sums=('238966f363aa6f24ec642838bcbfc6ff')
b2sums=('c07e166d156fc05615018a01ddf934905c725b9ce6254944e7222462cd66fd34a543ad958f0df5fd534d47451e0a82159f727d4d9e64e9b95a1f43548901aa68')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
