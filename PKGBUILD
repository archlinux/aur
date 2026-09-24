# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=oompaBase
_pkgver=3.2.12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Class Unions, Matrix Operations, and Color Schemes for OOMPA"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('456213ecb65d9eea996d1d9c485cf57c')
b2sums=('e691a28f39ba9104033e41abe0d6bf083512f73032c8042c630eb74e30f9b23b879044d0c0b1fe01855514227777fe30be313b4e619968fa540454ce1754a439')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
