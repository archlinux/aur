# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.files
_pkgver=0.0-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Assertions to Check Properties of Files"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-assertive.base
  r-assertive.numbers
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/$_pkgname/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6ec546e99c6466feffca3ab09a670c76')
b2sums=('547bf051175e142fb743e7b8ab8bdb1356cc66154cacb94a6e04e9ea1175a102d605a39f43cfeee4e0092498285f5e783d1d7f7f13f86ae37a18bb59e862a263')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
