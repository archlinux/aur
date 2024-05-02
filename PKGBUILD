# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affycomp
_pkgver=1.80.0
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
md5sums=('d8f6aac9b9ae955bd4ca06d97f1b5e00')
b2sums=('9728011db2e4d239966064017553afab8ba29f2d8cfc4e6fd2be8731be8c7d486dbed6471693283abc3f62bf355c264f9436730ce587d4f0e1947f4525ac4a59')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
