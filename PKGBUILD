# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.models
_pkgver=0.0-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Assertions to Check Properties of Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-assertive.base
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('93672bbfaa32c656ab6956e71aa0db67')
b2sums=('f5e1f7c489ac51b7d95b74dfaa11ad59c5d3f664e5ed266bd9221d365c0b4fba6c4a61a33ac70cf14810e651faabf2fa028f8fe43e76e887a1fc82676fd0a4e7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
