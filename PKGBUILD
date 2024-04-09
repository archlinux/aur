# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=JADE
_pkgver=2.0-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Blind Source Separation Methods Based on Joint Diagonalization and Some BSS Performance Criteria"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-clue
)
optdepends=(
  r-ics
  r-icsnp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b56c6d4b5be6b9300436ecb3e386fc80')
b2sums=('acae8c67420ed53a71db00d1d9b3894066d113e281a8ab8f1aa58a0571fe133ed0b5d732111a254ddaf5cea776d3e96f61efb22e93f1d3ebeebc749402a4cd31')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
