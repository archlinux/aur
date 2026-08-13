# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arrayhelpers
_pkgver=1.1-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Convenience Functions for Arrays"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-svunit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('03cb11a7649f5742a5a3b69c640665b2')
b2sums=('ad1be6cb5a8ee9a6ee08da4f959d86d2263d962f27779a00a60bbbab5a0df1929d75f6be96c53882b41889454824924048ba4d59c412bf67fc487837a3044327')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
