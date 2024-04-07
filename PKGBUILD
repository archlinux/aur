# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=changepoint
_pkgver=2.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Methods for Changepoint Detection"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-zoo
)
optdepends=(
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e1d6ec86180eeeaf36c3de1f54c872a0')
b2sums=('1ebe0eb2327cc17aa38fc1d2e5d2d6591b2edd56d49e8711489eeeb5f513813406700e6945b38e1d284257a617a368c077fd8792bb68526753560c1e8f34a323')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
