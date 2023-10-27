# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=flowWorkspaceData
_pkgver=3.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A data package containing two flowJo, one diva xml workspace and the associated fcs files as well as three GatingSets for testing the flowWorkspace, openCyto and CytoML packages."
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('96655cef2a21f1b9d303ec775597a2dc')
sha256sums=('d85fd772ec55091fbe0d57337fe84ee36225a28d16ad02bc5824b03450d0a072')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
