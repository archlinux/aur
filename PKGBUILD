# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=agilp
_pkgver=3.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Agilent expression array processing package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dbf0be42e3149d23acd29c60631252ca')
b2sums=('2e6c449d3619106e54ec1e6b7cfc6b61eb35be17b6c86ba6129b15e9bc13970fb47d440a9fbc654ac852b97b399c1c0ad0b471da358d6d623165ae8393773740')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
