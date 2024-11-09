# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=QFeatures
_pkgver=1.16.0
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
md5sums=('6013e8d25e7c98cfca285254718744c3')
b2sums=('3350298c53e0736816ad15f19fa2a6bebf4620ef55e4cb659a05fb5da30722d30db88c17c76c05c596a60cebd863521a99c092d159d4997bb3578106b7d07917')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
