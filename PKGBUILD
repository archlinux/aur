# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOexplorer
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="a webserver for gene expression analysis and visualisation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-car
  r-dt
  r-edger
  r-enrichr
  r-factoextra
  r-geoquery
  r-ggplot2
  r-heatmaply
  r-htmltools
  r-httr
  r-impute
  r-knitr
  r-limma
  r-markdown
  r-pheatmap
  r-plotly
  r-r.utils
  r-readxl
  r-scales
  r-shiny
  r-shinybusy
  r-shinycssloaders
  r-shinyheatmaply
  r-stringr
  r-sva
  r-umap
  r-xfun
  r-xml
  r-xml2
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-rmarkdown
  r-testthat
  r-usethis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6c99a9f75a8504d708ecba390366179b')
b2sums=('85a303652f04f383d9c5b6fef03f95a8ce10b8f9084fbe04b0880556d5f19ed921f921d43bc5d3ced0ca49623149e47cb8b06a2fb5ce43c1fd31bb72249698f1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
