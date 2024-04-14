# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tkWidgets
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="R based tk widgets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-dyndoc
  r-widgettools
)
optdepends=(
  r-biobase
  r-hgu95av2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('044f7f3666426cbac3929eb9af1ce9d8')
b2sums=('9f3f09de8a3a297c8348386cbc98d080e709d62844912f0b54afd2201ff03e552de45cdad82563750a7fb796ef0431897220eaa17127a4a4b1363c7288a270e9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
