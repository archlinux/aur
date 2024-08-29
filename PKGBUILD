# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=startupmsg
_pkgver=0.9.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utilities for Start-Up Messages"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fc060141694340354365f082bcb2de35')
b2sums=('cd0690675c25c0272777a767f8fef97fbc0d158208bcc7a395f2453da22229228d1278084b577a8c0aead04438830312b85dae4de009faf8d2b032d18bc3baf3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
