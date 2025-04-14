# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gss
_pkgver=2.2-9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="General Smoothing Splines"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ddf4f02f04d51213371f2bd48f661971')
b2sums=('e05ffb9cd4b4c53cb9682517386e8d082a3769df979b536c5f4219efc1b122238062c9769cb9047eca9eee65570ea7ef4e2dbf80c3fc746d63f7676eb52353f7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
