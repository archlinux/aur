# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=scs
_pkgver=3.3.2
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
md5sums=('1b8f2091f8a71c28d8506c9e546ed129')
b2sums=('b2842497d639fa38e3724c2ac424dcfb828e3fa36e0c531f0663fb95cab43df9ff94364cd72e1b9566556cf2598fbb4f0672a474e4353d304f2b7462f1ae424f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
