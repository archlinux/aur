# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cellscape
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Explores single cell copy number profiles in the context of a single cell tree"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-dplyr
  r-gtools
  r-htmlwidgets
  r-jsonlite
  r-reshape2
  r-stringr
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d64fa20725f314c69694f5dbb3fa29c2')
b2sums=('99454b044553beaf69b4763a0abfb641779c5c6fcf6bc05ef2246dc117e5ca4e478fbd2b5d8d4a69e3dcca21849214b7042e59d951623a5b785956f80911f59d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
