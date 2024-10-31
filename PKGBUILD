# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affycomp
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Graphics Toolbox for Assessment of Affymetrix Expression Measures"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
optdepends=(
  r-affycompdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9dd57ca955c7b4b9bf7e5787e060de4a')
b2sums=('71c2b3b3cf474e1d5d0ca15affb3eb46c93bda75175dd951b960d8841346d9dc61b49f1100c46b15a817a3a00f298f894d7ad24e7ad5897062cf1da2a2e1dd76')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
