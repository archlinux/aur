# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCircos
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Circos 2D Track Plot"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a1bf14fdaa2933f090ceab87803f9988')
b2sums=('bd734acd48114628f942dc6534df1ce24d940a2e68eaffd747f6701bc3bbb7b18b59890db14e18dae432240f353e9e12b6d093d738eb99320c74aff567667e27')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
