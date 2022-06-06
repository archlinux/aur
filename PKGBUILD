# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=QFeatures
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Quantitative features for mass spectrometry data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
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
  r-s4vectors
  r-summarizedexperiment
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
  r-magrittr
  r-matrixstats
  r-msdata
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
sha256sums=('97ef47682bf6fe35b542c29e5dcd033419aae20b25af9940f0a7911d10e4e1fb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
