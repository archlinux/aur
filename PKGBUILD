# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=capushe
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="CAlibrating Penalities Using Slope HEuristics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c80cfe276d1f4f27bf3ff80ac1872232')
b2sums=('5ed3b67256c341e39c59d968c4838e1b5b293303955a95167f68c6146999631b8cfad0b13281c7945497339875c6ee5f527b4dae357692d6e9d43d24a8c5b38a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
