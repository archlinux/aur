# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ZygosityPredictor
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Package for prediction of zygosity for variants/genes in NGS data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
depends=(
  r-delayedarray
  r-dplyr
  r-genomicalignments
  r-genomicranges
  r-igraph
  r-iranges
  r-purrr
  r-rsamtools
  r-stringr
  r-tibble
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c201664f307a2cf422119e2fa87759cf')
sha256sums=('cc26ab6a56051056f82a4cc972d7de845c8e78e874ee40969e992de4d2cf7c03')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
