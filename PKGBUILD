# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rook
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="HTTP Web Server for R"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-brew
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6c7367f2232b26aae79e9825613079b1')
b2sums=('547de3553b8753292ba4f627f453bb7da025ea7cd2ed0bb1f84db43342b79abb7bea9ca1807377d1d2dd9e0d68983015edcc3f2fb4f03e01bb5331e8a0763474')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
