# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AnVIL
_pkgver=1.20.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bioconductor on the AnVIL compute environment"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocbaseutils
  r-dplyr
  r-dt
  r-futile.logger
  r-htmltools
  r-httr
  r-jsonlite
  r-miniui
  r-rapiclient
  r-rlang
  r-shiny
  r-tibble
  r-tidyr
  r-tidyselect
  r-yaml
  r-anvilbase
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-readr
  r-rmarkdown
  r-testthat
  r-withr
  r-anvilaz
  r-anvilgcp
  r-lifecycle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('47ccdd01ab9574ef73f4b7b5ba364642')
b2sums=('e0fb864d09e53af51b206361eeb6d767c3802ed23935fa88a29a278ccf338f5ce616e111f6ca35844d5d381ee56eb31d45d3f8d899bf17f0305c483cd215cb9c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
