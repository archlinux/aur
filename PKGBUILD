# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NTW
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Predict gene network using an Ordinary Differential Equation (ODE) based method"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-mvtnorm
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1cb5b1ae26a2ac8003c49569a5a00a83')
b2sums=('1c6e5312864f35290a9cc809b7f23f1bf75b071736ad09b75b36fc92fa13c2cf3312dd06872d3196e75507e53bfb2a994969467714eaf481a60a13bf666a5836')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
