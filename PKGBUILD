# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gss
_pkgver=2.2-7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('e86db9bf39e0d151e7242e42c9b6f7ca')
b2sums=('5ae14240d9e8e6b4a7eb2efd4a6423b59efd7dacf587bcf57bfa41c44938e693ffa0aa1b93974baea70dee41a811dd25727a5ece7d250e0787f06341ce462c74')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
