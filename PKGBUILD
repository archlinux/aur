# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fdrame
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="FDR adjustments of Microarray Experiments (FDR-AME)"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6de56b8d555e47e22016d7db11cfd809')
b2sums=('667a5924e9a0d30456b34d352bedf7dcfa2a9ae3065ce5e4d5810f111309084ac54c55aa0124388348f50c521520cf772ba7f660af0b4e3e1253c46d60874d6a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
