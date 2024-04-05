# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OSAT
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Optimal Sample Assignment Tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-biobase
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('64bba183cfa8a211960d891cb5ee3ddb')
b2sums=('906b74290412ef0cc7199b3c5690229c0297360bb0c294ad07f9ca4eaada3a94055b41cec14e80965f08bdcf83dc4468d48d7fe6aeed52564b15d699f0221e88')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
