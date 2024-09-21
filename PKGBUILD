# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenSA
_pkgver=1.1.14.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Functions for Generalized Simulated Annealing"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  blas
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3009ca659f16f997ed1b04160948e252')
b2sums=('7aaf894a643291affc915f617a44dd70ada72732af7f17445c89526a500203733f339e1216cfac7b4f724bec21904d1baea42b3de97fafee73c3f53177fa0566')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
