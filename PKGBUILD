# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fmsb
_pkgver=0.7.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Functions for Medical Statistics Book with some Demographic Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-epi
  r-vcd
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('281b8f4834c1583168cb0bfd32b58ee2')
b2sums=('c26909c62c231ae997e7b27ee382918ccc5ae83536f10a31d00cd3b96f582eed4a997a1327ff25814dd1221d00b1ce4eb4c26758e1a9116819298f8ee05540ab')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
