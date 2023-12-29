# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genalg
_pkgver=0.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="R Based Genetic Algorithm"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL2)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6677e43553558816799b33d10163c09d')
b2sums=('4225fc3d12f5a4911e4ddebda944e69bb00824b45d86e3613a6c428f868ed1627e62479bcae94785b3585d2ed1c4345e5566468fed82849c47de188fd007855e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
