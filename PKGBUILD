# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=peakPantheR
_pkgver=1.22.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Peak Picking and Annotation of High Resolution Experiments"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-bslib
  r-doparallel
  r-dt
  r-foreach
  r-ggplot2
  r-gridextra
  r-lubridate
  r-minpack.lm
  r-msnbase
  r-mzr
  r-pracma
  r-scales
  r-shiny
  r-shinycssloaders
  r-stringr
  r-svglite
  r-xml
)
optdepends=(
  r-biocstyle
  r-devtools
  r-faahko
  r-knitr
  r-msdata
  r-pander
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('871ef62c1719f1a002dcc561ae4d8cf7')
b2sums=('c6b64f00a861cbc10708c9c6a7834a06fe67a26fab138047e4e0880a5c1b8248572fabcb0cd1be8405ceca8d2611a728c86b896c72f194b52b4310d529080b46')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
