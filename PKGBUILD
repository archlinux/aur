# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mhsmm
_pkgver=0.4.21
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Inference for Hidden Markov and Semi-Markov Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f31ad965a28d4a6fe83ecd659ee53cad')
b2sums=('8491e1fbf2bf490355ce93ed9d78d75f79921623f07cc4303987e4eb819e33dff69b51f79a0976f9503eedb2df7bb6e0169f5742e4c1f0b1e60e3a8a4a42625d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
