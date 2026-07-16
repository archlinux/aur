# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=QFeatures
_pkgver=1.22.0
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
  r-arrow
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
md5sums=('f353735501524059f9bb1c3845d4711c')
b2sums=('119d8e6a53b838af0bd41bbad42d51669c5676bc6c85698a4d5f8b2bd6f4413edd37fcf675c1436d480b535fcf4420afa96929c2a027b2c53e26ebce32821263')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
