# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=peakPantheR
_pkgver=1.22.0
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
md5sums=('896a630a7de2711224ff8827fdeed199')
b2sums=('15261bcb25ca9d22cc8773d368b352c5ab797634a35ef6db475072ae97408cc890dbddfbbc9a55e6510548505a7fef6cc3e6f0568a1795c855d696c6bb0204d5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
