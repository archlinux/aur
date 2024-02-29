# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=effsize
_pkgver=0.8.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Efficient Effect Size Computation"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('83ccdd795b41c2284cdc668dfc5cd0f3')
b2sums=('0c59738a1e38e012568b1c1732f9894845f335229e91e5ac072fbff35afc817f59b74d5778b61b2a16c3db835bd7cee9ef3005a73f9977a3f5a78a46915bab7c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
