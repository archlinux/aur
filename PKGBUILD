# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=profileModel
_pkgver=0.6.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Profiling Inference Functions for Various Model Classes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-gnm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('06a0703e2b2c77b5bc0bc41f45cd0a64')
b2sums=('91a969c1dee6d94ac9be8f029b2d9dbee6abab7c4dd0006fbce9737b8cf5efecfbd3d36b326f9886a6664e071f86fa1ec18d102a05f99c8e12e5b335ceffef97')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
