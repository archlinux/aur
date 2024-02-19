# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fftwtools
_pkgver=0.9-11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Wrapper for 'FFTW3' Includes: One-Dimensional, Two-Dimensional, Three-Dimensional, and Multivariate Transforms"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  fftw
  r
)
optdepends=(
  r-fftw
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('00731a7e2b23d9f9cff0953b5aeae5f5')
b2sums=('6bf281d4ed8c92a1c356628cc8b0ee6f25b63cfbbebeae5b5d59a5659d6c9ab405c3b6da40903c693e8a5dbcacd1e17e7eab3c1a9b8704205d78380547a9d615')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
