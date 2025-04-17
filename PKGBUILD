# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affycomp
_pkgver=1.84.0
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
md5sums=('ad80dbe6794a7e94e5c605f1ed54e617')
b2sums=('4c88681893a636ab162a9e6e523a2f29c2e975487a3811c4c1ecb336f71915b8a93658e040bbc53237575966311151b4c691ab90bfa5c0e61488cd15d3e71237')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
