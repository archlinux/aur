# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=hexDensity
_pkgver=1.4.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Fast Kernel Density Estimation with Hexagonal Grid"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-hexbin
  r-spatstat.geom
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-ggplot2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b87afb98d1a5c2b450d8ccf80c025042')
b2sums=('0f97ec71eb200871f91923d7ff43b93f3fec333e8949ea3a48018f7e03858c9dfd66fd493db28b04c72f088c0d1d65dd03cfb2ea80ffc1fd74c0fa9ce44d65f3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
