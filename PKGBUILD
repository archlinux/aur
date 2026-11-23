# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=SpatialPack
_pkgver=0.4-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Tools for Assessment the Association Between Two Spatial Processes"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  lapack
  r-fastmatrix
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('19b231a657b279cc76ef28b32c7535a0')
b2sums=('1c20a32dc70a4d9bc5f000e3821622a8c4a9e6f05cf6b289cc83778053d318ffcc874ddc9c20e46bd1a3a36021c083764b8967a3b1e8f8669c39445d9985cbb3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
