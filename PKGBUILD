# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lokern
_pkgver=1.1-10.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Kernel Regression Smoothing with Local or Global Plug-in Bandwidth"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-sfsmisc
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c9c624d48206203d261b3e84255bcd07')
b2sums=('783c4c1ac35fa63add4cce0395d0aae1272071ba948abab383314ac0c0c9ee833723abce4d995307457be0de6b6cc10807de64cf47c5bc359d7c4440f569b557')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
