# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pegas
_pkgver=1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Population and Evolutionary Genetics Analysis System"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-ape
)
optdepends=(
  r-adegenet
  r-rgl
  r-snpstats
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('eab36d8aa056ab1684caac07665a98b9')
b2sums=('d0fbe9dd2d5c25ef37c80eb9521c1db79c11f2b83a43cad0ebdc13795cb1444ba47f106397e448f467bf210a7a897e97dd26568885d03eabf4523baf1fd91b36')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
