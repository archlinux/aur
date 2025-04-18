# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=QFeatures
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quantitative features for mass spectrometry data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationfilter
  r-biobase
  r-biocgenerics
  r-igraph
  r-iranges
  r-lazyeval
  r-mscoreutils
  r-multiassayexperiment
  r-plotly
  r-protgenerics
  r-reshape2
  r-s4vectors
  r-summarizedexperiment
  r-tidyr
  r-tidyselect
)
optdepends=(
  r-biocstyle
  r-complexheatmap
  r-dplyr
  r-dt
  r-ggplot2
  r-gplots
  r-hdf5array
  r-impute
  r-imputelcmd
  r-knitr
  r-limma
  r-matrixstats
  r-msdata
  r-msdatahub
  r-norm
  r-pcamethods
  r-preprocesscore
  r-rmarkdown
  r-shiny
  r-shinydashboard
  r-singlecellexperiment
  r-testthat
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ea333a9416cf561fa5601abc2369ca9d')
b2sums=('2a916ee4d7da27031cf120e6b5d9e8312e516c5a935808866c49a7a59b758a244ea3074d306039f59d8a983983c42b8a639eb084cc2cc02d68be4935cbd54bfe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
