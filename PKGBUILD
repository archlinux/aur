# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affycomp
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('f80b53dc57dcb88730eda3c0506b9df1')
b2sums=('486cfaa55066969b74b53f897ee8a0c79c663ab47654c7cf212dc817998b3ca140746000ddd574ea950aa921f3872d70f760d84f37f9ac412799f746066bd156')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
