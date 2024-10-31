# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocVersion
_pkgver=3.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Set the appropriate version of Bioconductor packages"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('118dd948af617820eab08b946fb28cbf')
b2sums=('fb38fd5e7d19e49a8a2ab8ab0c791c937cd56e3a20b89cf983b4e4e249268e9986d101eb22eaf792242be7d179281d92b69ead0b021dae37024348d63e31c65c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
