# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqmagick
_pkgver=0.1.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sequence Manipulation Utilities"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biostrings
  r-yulab.utils
)
optdepends=(
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-knitr
  r-muscle
  r-prettydoc
  r-rmarkdown
  r-rsamtools
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('16ccd05fbe6dd046d0efb0bbed067079')
b2sums=('56b7fd98f76566f0df25b0f13cc2e0ff11a2a4feb4ebbec1c4f7cbcebb36a054f367b0fb4a69a7fc1b882b5b2ffff0f4c970a7aa9791f0ca7a01d4bcdb0a8e8b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
