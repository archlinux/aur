# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_pkgname=dada2
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Accurate, high-resolution sample inference from amplicon sequencing data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-only')
depends=(
  onetbb
  r-biocgenerics
  r-biostrings
  r-ggplot2
  r-iranges
  r-rcpp
  r-rcppparallel
  r-reshape2
  r-shortread
  r-xvector
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7b804276d0f5e33f11d07da065b5a716')
b2sums=('f516cae3fce2fee3e24176cc5001cf192a639ac861eb89f6aa63ec8a2ec74f9c4dbe52910dc78b6009b62b6a7d215cb18b63d697a8589d11724abcb43e04a0c1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
