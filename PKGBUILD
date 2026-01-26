# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mcbiopi
_pkgver=1.1.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Matrix Computation Based Identification of Prime Implicants"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('53307193a1242782c1ac8244b1fe1966')
b2sums=('2f0cfa94f7b86ddd05b114a393f74be72ef048064687b597973c83ed40272376cdcccf3f575031a2d611f3f8dd69ad247471314cc8dd673feb76218182faaf27')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
