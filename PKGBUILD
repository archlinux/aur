# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HEM
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Heterogeneous error model for identification of differentially expressed genes under multiple conditions"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('72ff71e5cae74145120758b61835852c')
b2sums=('341108c0251e95ed4787fb53853d022f579ee977baa67720e48f669406a9ac1caad4b7ec5bda9fa60a8ec9523f9701a2da03863c9fae49adc22a7eb3ba0bf570')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
