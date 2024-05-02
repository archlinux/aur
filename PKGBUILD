# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rawrr
_pkgver=1.11.14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Direct Access to Orbitrap Data and Beyond"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  mono
  r
)
optdepends=(
  r-biocstyle
  r-experimenthub
  r-knitr
  r-protviz
  r-rmarkdown
  r-tartare
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('00e5da6af7241db2d8226cfb4cd21cc3')
b2sums=('4308f9097ce7dbad3e9b593fc2d79fc20e652c2a30eb7d3a0fbbdc030f8fe2b078a15bf799f8e7ec32756366ead9cc17d99f51421b32c8d4ce47aba467d04289')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
