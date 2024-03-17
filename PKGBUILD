# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=aTSA
_pkgver=3.1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Alternative Time Series Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7bee1f397b1605e9754d31463085a0ae')
b2sums=('94e1d537266e80e8498e3307f39ea2939dbb21c75a29be8127a758812b2b51701a937dfb7e1e1cf295ace8705f247fe85ec5096975c468912bd3796174b35f0b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
