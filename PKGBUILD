# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqLogo
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Sequence logos for DNA sequence alignments"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0771c35a7929a3e71aa5eebaf4a624ef')
b2sums=('eb3617cff1acd7ef1ab7df0eb7b8eb515455cc732b50353fd15ccb8fdc66181588cd0de7914c7c092f5e608be0dc58f9bdd56e45960f5416ce17e7d7c973116b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
