# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bmp
_pkgver=0.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Read Windows Bitmap (BMP) Images"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-pixmap
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8602a66ba473b9648f7ae87fecaf43bb')
b2sums=('57e7d94dba79b34efedf89a42e83345cfd426c58ce9167ddef291734c6217ca9c974e90e491438fc429ac05e17137616e6a925aeef572d3755a782bbe99c542a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
