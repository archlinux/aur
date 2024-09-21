# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AlgDesign
_pkgver=1.2.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Algorithmic Experimental Design"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1beec173e3c5bb98f866a30774731428')
b2sums=('4d89fef8bc51068cbde0b7d6185abf8dbc9636fac309454a3c54d19ef367fbebef70f9052ab4203f14903e3a7218ffde7e7b3028430709c21be20b2d1f6fb9dd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
