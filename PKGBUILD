# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=slam
_pkgver=0.1-50
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=13
pkgdesc="Sparse Lightweight Arrays and Matrices"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  blas
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('75f6386e03e38dd6d6bcd63bfe257ddc')
b2sums=('f1eb0b5a9744dcd0c937d2cf0d3b74c186a43523ed32b065f70ec05d6f43cfab28e7aefb7c83b3440e6971fed38f2156a7746c7c19ce3fe87968d06f0551ed9b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
