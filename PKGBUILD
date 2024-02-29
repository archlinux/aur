# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RPMG
_pkgver=2.2-7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Graphical User Interface (GUI) for Interactive R Analysis Sessions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e2d6622e786f2704235fc960d6efd6f0')
b2sums=('0fd854010ba2dfb5070b1b135432cb41ee211ce66b73e2dfe34ee120d216d27b17c70b64c6d48dd8651831ab209adc20788b064931867ee3c6b8682a318fd164')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
