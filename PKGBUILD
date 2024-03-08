# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=grr
_pkgver=0.9.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Alternative Implementations of Base R Functions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7e5bb79c5fe4533e0d2ac80485912dec')
b2sums=('608d5e74ea87c44f31565b2999e426168a6aec827c0d90294bb04f3653d8f8c10746b3cc2c754385f1ec766fa1b029f54ecd8426bdf92f149ded77b1ddaee58c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
