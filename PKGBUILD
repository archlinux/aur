# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rnits
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Normalization and Inference of Time Series data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-affy
  r-biobase
  r-ggplot2
  r-impute
  r-limma
  r-qvalue
  r-reshape2
)
optdepends=(
  r-biocstyle
  r-geoquery
  r-knitr
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c00be046b38c148d93c06f51c73ced19')
b2sums=('82121c2b96c654fe417945091a07c56fcea2c0a9845a3f82d80d2a7ee0ca1a26532a261d9574e0936d92570d853e9f405525a035c817d277703b6b1dd61d87f1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
