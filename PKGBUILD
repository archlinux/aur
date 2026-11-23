# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flashClust
_pkgver=1.1-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Implementation of Fast Hierarchical Clustering"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3f9476e91dfd94a233588e3c037d25e4')
b2sums=('c7d2a7be1e91be4ceeb09da6f17469aef9b924b69d565152bf6618582392cfe8598dc970a6121ea64c7513d179ba48c65c8e39c6c4703a0b7b670488fe66b0b4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
