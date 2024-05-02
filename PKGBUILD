# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nuCpos
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for prediction of nucleosome positions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-biostrings
  r-nupop
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fb6584943aabd0be366fae1720d094a4')
b2sums=('5d74f0c07c362e115185890a912dee7e138ecc31fbb85629652d343bccbdacc57ee5d2c825c860584d1a7e1386157e7cec83f4daaccc4f9b81e1f3e089a11094')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
