# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.data
_pkgver=3.1-9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Datasets for 'spatstat' Family"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-spatstat.utils
)
optdepends=(
  r-spatstat.explore
  r-spatstat.geom
  r-spatstat.linnet
  r-spatstat.model
  r-spatstat.random
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8bedb3fa5ce929975e512386122d580f')
b2sums=('8957c3c15b1bb97e134f645e00a362871bc6724405f8eefc83d167c31089ff71a674d52c18ee0fb798d3f3cce7523cb6af959f5a677822d7a0672a742b518b4f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
