# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scam
_pkgver=1.2-20
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Shape Constrained Additive Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c33bb135c90f0e0687beab45cb569283')
b2sums=('0358bc21879feed3dac9a86f696277669739b6079332ebf204bb04220d33b0c4076113a488fa050bc973eaa9a05245aa755da8f0e29b5772fbd8f216fcb60cc8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
