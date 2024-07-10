# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=QFeatures
_pkgver=1.14.2
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
md5sums=('65cc1b47d867aba47a1d42c3069b1e8a')
b2sums=('ab12bdac93fc2b9dd170220d89c1a4daf1f1b91eb96625b02d07ca19521095b4bf5edeb7ded2eb215a4b5efeb8fd2679122b3ac872d87870ec9844d316611dde')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
