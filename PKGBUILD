# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AnVIL
_pkgver=1.20.1
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
md5sums=('27786ce7c5a18ef7b7a2835b8611acd3')
b2sums=('5dbbdc66e0dd1b90f90a1237a0fb8a1e413ad40f32443180ab9b30b336aef5453a75826e2faca225385b9372818640e639d70eba963ae1913bc0e95f4271a04b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
