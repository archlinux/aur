# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lokern
_pkgver=1.1-12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('1350231edf221865ba4be08a0c47d944')
b2sums=('52d24cece1e787cca728f5ae8e8316313830a22625a2ddc4c8d284cdcafeabed21ef8fa814fa45d2fc752bd40c106671415f2a943db8fa48159cbe58dd22cf7b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
