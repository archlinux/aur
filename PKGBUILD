# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=conicfit
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Algorithms for Fitting Circles, Ellipses and Conics Based on the Work by Prof. Nikolai Chernov"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-geigen
  r-pracma
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7d0be38f6477670c1259136a8587f085')
b2sums=('ef4a50290604db9cc32dcc2c85469748fc29e81987a85a030372c3e56df43812d59072178a7bdc24b5f3721713c7711112e6e14e0ee3a9ea1247f9b882961cf8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
