# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.utils
_pkgver=3.1-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utility Functions for 'spatstat'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-spatstat.model
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bb96caad9ab02aa115fcf1a13864797c')
b2sums=('1990b8e03b1e00cca775486e422892292d97b07289edbb3d782db8cf06ad2015a4393ecd63111558011a7f657f967c3f5ff5789aabc16bf3fd2f98896de7b1b9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
