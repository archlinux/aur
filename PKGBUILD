# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ineq
_pkgver=0.2-13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Measuring Inequality, Concentration, and Poverty"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e2561a25905ac60168c18bb4f6c1b253')
b2sums=('e593399acd131edd33acb9fb4c08a6af7c5131382edfd0cb6bef173a95fd6230e208d54715d2e46da39a8d6e8a6a333b88e21fe11395e6f3f015105fa23e2793')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
