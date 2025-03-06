# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppDate
_pkgver=0.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'date' C++ Header Library for Date and Time Functionality"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1f71bc4851847cc17156e5fbd5aff6b0')
b2sums=('0a3587a29fa637857bd24c8af21b431f0f4a043efa3c58030e6bd8c215f0ff288fbcb4b271b41cde1380e2dc1b2d2aafd1ca3855d2a369dccd2f03b545faacc3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
