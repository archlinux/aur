# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dixonTest
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Dixon's Ratio Test for Outlier Detection"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL3)
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3f0dfa902dc3f22986b729f500f9ac63')
b2sums=('126309cab66862de09a4032d61d161dfe08eccafe0799a065046e96270a19890054c2708335d1dc182429a86b2fa912b99bdcdfad30c20d5123cd824ba4e0883')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
