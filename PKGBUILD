# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=runonce
_pkgver=0.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Run Once and Save Result"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-bigassertr
  r-urltools
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c4d8db5df94c576bb4f874e44a1e5326')
b2sums=('19053ba5365d090e4400be9c7a5c8cd3617b057d4f4a6d5a2d6f484fced9d227a4e306ba91c2afbe3e3f420f58995d2b0bb526b468ba18a532283a2a9e482448')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
