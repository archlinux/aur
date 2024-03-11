# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=segmented
_pkgver=2.0-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Regression Models with Break-Points / Change-Points Estimation (with Possibly Random Effects)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1ea139e06c62456571430a62cc3cbc8b')
b2sums=('96d706f1df10c0b9ffba604bc1e8d684ebaaf153224f754fad90379b8f240b3d4e78580ea5c761faf989a244e6f7c632619ac6862d64590964e925570dbd78c2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
