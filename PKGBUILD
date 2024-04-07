# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SQUADD
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Add-on of the SQUAD Software"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-rcolorbrewer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8837e27ab065ddae145da3cc5ca2ad32')
b2sums=('cbe6bc24762b56c8df25c3a407ef77040cc5d7e74a364cd845107ace66c968231f7fb13880211a723e8d5bc52719e75952e411e5ccbf9daaa0e61fe23f33f5cb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
