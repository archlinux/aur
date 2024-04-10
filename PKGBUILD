# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=base64url
_pkgver=1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Fast and URL-Safe Base64 Encoder and Decoder"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-backports
)
optdepends=(
  r-base64enc
  r-checkmate
  r-knitr
  r-microbenchmark
  r-openssl
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0e41f7f53213278d81e2d1fb55b34480')
b2sums=('1bde4789d2f880ac81bab2b6dee8867243a369443431d8e2d30b48c31e8c2966de33b695d407754105dcb021dcd5cb035db05fd09558a6ecbae7e0dd8c11a432')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
