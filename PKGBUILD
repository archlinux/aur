# Maintainer: guoyi <kuoi@malacology.net>

_pkgname=dartR.base
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Analysing 'SNP' and 'Silicodart' Data - Basic Functions"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
  r-adegenet
  r-ape
  r-crayon
  r-dartr.data
  r-data.table
  r-dplyr
  r-foreach
  r-ggplot2
  r-gridextra
  r-patchwork
  r-plyr
  r-raster
  r-reshape2
  r-snpassoc
  r-snprelate
  r-snpstats
  r-stampp
  r-stringr
  r-tidyr
)
optdepends=(
  r-devtools
  r-directlabels
  r-dismo
  r-doparallel
  r-expm
  r-fields
  r-gdistance
  r-gganimate
  r-ggrepel
  r-ggtern
  r-ggthemes
  r-gplots
  r-gtable
  r-hardyweinberg
  r-hierfstat
  r-igraph
  r-iterpc
  r-knitr
  r-label.switching
  r-leaflet
  r-leaflet.minicharts
  r-markdown
  r-mmod
  r-networkd3
  r-pegas
  r-pheatmap
  r-plotly
  r-poppr
  r-proxy
  r-purrr
  r-qvalue
  r-rcolorbrewer
  r-rcpp
  r-rgl
  r-rmarkdown
  r-rrblup
  r-scales
  r-seqinr
  r-sf
  r-shinybs
  r-shinyjs
  r-shinythemes
  r-shinywidgets
  r-siber
  r-stringi
  r-terra
  r-testthat
  r-tibble
  r-vcfr
  r-viridis
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5bf9a9a98080c55e1de812c2bce9a082')
b2sums=('9295823ce7473fb96331f3d89c2b03cf1b4077c1af478f615be6cbf6088a748b3b5592d8194a2dd4fa9f5bba1bba7593619c006318454fea111dc8cef13d0b15')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
