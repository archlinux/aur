# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=matlab
_pkgver=1.0.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'MATLAB' Emulation Package"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d69096742f7e29bd749f91060984195f')
b2sums=('b790edd538eed00136aa277ba6b46d81622a0395bc4a8dd375fa83bb47e99c1390ea9808b2276da5b41cf4e4fb01388d5a1fa2102cc7abbebfcfca1a3af1eb03')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
