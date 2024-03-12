# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=widgetTools
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Creates an interactive tcltk widget"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bb5358a7e064436aa744ffb098a9c0ec')
b2sums=('f603577b6fb5bba84cea663e24b85f89ca34ccaa38ad2fc2cdf1d067b707b29c81b3a6e5f1dba1cc511a0d8a54045c1409377fc012e2e0fd0f32275f7544d499')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
