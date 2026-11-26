# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nuCpos
_pkgver=1.32.0
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
md5sums=('e14a8a7696741eb0b43f5ec1cefa1183')
b2sums=('dcb4a8f1825653847c63ae0c73d9c8f966642eef2663c21bad10332e346ead9a2b0c100c460b1778a9e9c491e88d5735051ae3c735a48a6f24e8163757aee597')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
