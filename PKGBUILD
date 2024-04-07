# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rsolnp
_pkgver=1.16
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="General Non-Linear Optimization"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-truncnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('507e1e1a64f5f1d32b7e4e12ed19599f')
b2sums=('ab72c3ac0ffd9f29a70553841fe59571a5ba3e05f3efb72377219159b9b8ca9563c6006a41e5450fddcaa75982bc0db8f297797ca0166683bfe902425c1aef06')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
