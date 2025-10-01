# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AnVIL
_pkgver=1.20.4
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
md5sums=('d0e18f9e1f16d4d1fcf9aa6fa07a20e2')
b2sums=('95e12f600b5cd54c1c343f55286f83355a254a0c2e574b34ab9dd15c275fdb7f69cb6a35c10257cfbf3957367ca1378c308f0644b99e447a98ebb643e3ed4926')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
