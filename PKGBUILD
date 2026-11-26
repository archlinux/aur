# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NTW
_pkgver=1.64.0
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
md5sums=('3d884c8d7b01d248e7ba3333c33a6e76')
b2sums=('be41f60b524b556e691fb9124f1b3fe9143c1b5f4db42ccae5a56702a31314c02c405733e38572b29a74be69dae19bc64a4509c7c1dd51458a3d662a461cc412')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
