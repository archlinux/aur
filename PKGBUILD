# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ISoLDE
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrative Statistics of alleLe Dependent Expression"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('71a61bc791d84938d4e7f5b5f705feaa')
b2sums=('4c727481dccf7f90510bf18357943670617c82fdc91581acb9deb9e7279a74efbfe9aecfa0daa63f16c8b3446f43f3b46bcf49827d017eb2943f5fd3dcfd7157')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
