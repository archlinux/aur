# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bioDist
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Different distance measures"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
optdepends=(
  r-locfit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a0c907dc82834b4771074cd8164cf773')
b2sums=('03d317db1886268164f1ee1ab60dc5de3120d3d497f4225f7197165bd2aa3805da7f0d4ee9261d04b2daea650c86399fd264ebfe0471e0af81bac43fa3dab4bd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
