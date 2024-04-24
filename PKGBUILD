# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AlgDesign
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Algorithmic Experimental Design"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fd2c7ba6d0cc0b438dd530c4a25c4017')
b2sums=('6bffa83b310a1f2a2a33fce7ce9458cb08ddf648deb9389d9dfcccdf437a51d78f58312dd0625c927f32f9058f5cf1b78ab6bef78307c51ebf1d1a24e1505904')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
