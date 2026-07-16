# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methylscaper
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualization of Methylation Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biocparallel
  r-biostrings
  r-data.table
  r-pwalign
  r-rfast
  r-seqinr
  r-seriation
  r-shiny
  r-shinyfiles
  r-shinyjs
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-r.utils
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('831a57b1219c7ba39b3514447e3a64b3')
b2sums=('9c8ecae8fd69e7f7881aea3cb0d6e4d3f40e43c1ebccf2db9eacf4ec0e52dd445be9aa619978f3ad6358ea3f2c811204d15b72d2c1648e9c2800ff3c93404dd5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
