# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=scs
_pkgver=3.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Splitting Conic Solver"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  lapack
  r
)
optdepends=(
  r-slam
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('58594f5bbdc4ef5800b5975e3ca57a1f')
b2sums=('b397b61f79ec05cdf28e2991ee7681351b5397e30148dd92ba4eaf3e2db6dddf6469317e63f771c55128828e24665ab0eb4180f146ce0553ba1730aacd90746c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
