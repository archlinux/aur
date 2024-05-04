# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=flowWorkspaceData
_pkgver=3.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A data package containing two flowJo, one diva xml workspace and the associated fcs files as well as three GatingSets for testing the flowWorkspace, openCyto and CytoML packages"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6bcbf15993fefdb1282e08bde8050251')
b2sums=('331f806569a7685623c96c7eeec8b767b0b6b64b5de58380ffd0e2c130e7a7fb85b18fe107824a0fd3b71b4afdf8cdbb6fafe6e46f37712694f3ed1d143d1403')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
