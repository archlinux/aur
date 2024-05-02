# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dir.expiry
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Managing Expiration for Cache Directories"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-filelock
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2d8ad1bf4ac3af8121ba7d7648088ad3')
b2sums=('b911de0fe46b53d0d0cfa8a59fc1dfa81f7cac847d4a03a60fc6a17b325904299f8c4a2df2c3937a8f92dd5cf7ec8e91f2fa0cc1b34d22ece885cb3ca2165146')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
