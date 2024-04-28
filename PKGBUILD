# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ZygosityPredictor
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Package for prediction of zygosity for variants/genes in NGS data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
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
b2sums=('807ef9bfc2eb3c8c219201dfe232955c988aa504d607925e7c25659ac8cb161bfca32db7e4700bd6c3460921207c120b3757e81d6d29493a43701785d656b293')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
