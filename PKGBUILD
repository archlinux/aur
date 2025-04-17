# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=copa
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions to perform cancer outlier profile analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
optdepends=(
  r-colonca
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a2d52e6390ec07c5bec0e3e78e19e6bd')
b2sums=('eecee4b8df84849d447b5a58fe9cee02b1895cf24cc59590e830a730541193eba1b7cd293c9e1cd1b4734129dd4820e082d2cffe91a3069dd5a92d68aaef0c45')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
