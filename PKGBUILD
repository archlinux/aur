# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rawrr
_pkgver=1.14.0
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
md5sums=('55a9376088cb6b3fe2a698aef0000063')
b2sums=('3e1162ef9b8a78f2ae5924a5718ceae5fe8a93c57bd89df0fe3f567a10f21d5d22f193b2f5e734011a0efec76116d7848f060c7a712c58bed144b8755a928e22')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
