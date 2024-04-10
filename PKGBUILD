# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BB
_pkgver=2019.10-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Solving and Optimizing Large-Scale Nonlinear Systems"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-quadprog
)
optdepends=(
  r-hmisc
  r-numderiv
  r-setrng
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('34607566d639cb346e1b979767945fef')
b2sums=('58d45aaaaefe9d364b6960230fad8dc10d3d9d5d0b434df63856786ea0fd5d57f3a9ea93b9dde7394fe7dcb4237f576d46af618b9e86dea21c6dd93db6f4cd7d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
