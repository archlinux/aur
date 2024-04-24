# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Iso
_pkgver=0.0-21
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Functions to Perform Isotonic Regression"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4f9172d1c292a3a7fd9a40c034197e94')
b2sums=('9e4dff1ce8b7c381e58bad9ac6225881457d916659453c21ab1411b684ed88d60a7c80ba735b2405f0ff056f99013a7b0ce0bfcc852d29a1a20694157bf14c39')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
