# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AnVIL
_pkgver=1.20.0
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
md5sums=('1db155608bdecbe033cfeb35ae1444ad')
b2sums=('13d8c0f5855ce05853c028bc6bf341d231420e2b1716cf382814a9e7f349791535ba5364cce5e2ec6c243f8698e142503ebee80500aee5b832192e9a4a44ac10')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
