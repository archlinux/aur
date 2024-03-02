# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bdsmatrix
_pkgver=1.3-7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Routines for Block Diagonal Symmetric Matrices"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9bd961875808728b8d78e934855d3175')
b2sums=('7632a7d4d2b3d7184252023da7b2648517b1e4bd07cb12fed265b90fbcbbb8a1fb4b9b737f83e301a60bfad7086f820562347dcac1a8c92304adb07c4b32be90')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
