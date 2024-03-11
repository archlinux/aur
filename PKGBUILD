# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NMI
_pkgver=2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Normalized Mutual Information of Community Structure in Network"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4c7ff8b6dc4834b2cfbe0b8cc9b5d88a')
b2sums=('828166b2e3d94f5238e9c20bef3cada33d7b48ac2c23e39ead02066c48d6cc1e8d119f39c311162a02c39257ecd47a15a28af65a6e46e61c3220250d7745cd99')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
