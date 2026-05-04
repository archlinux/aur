# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=praznik
_pkgver=12.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for Information-Based Feature Selection and Scoring"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dc2dd05f41ec8dd1ffa1ccc297ae0000')
b2sums=('f45ed2e8b71dfaae47ee9affe079e3c808874069e01319c0dd7c2d220f3caa05ef493023a2500e0100bffeb5fd4b651cb81b9b66db00e553c33bfaa55180ed93')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
