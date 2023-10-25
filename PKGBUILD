# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=flowWorkspaceData
_pkgver=3.13.0
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
md5sums=('31738ec55a2cad5f44790403fc26ae45')
sha256sums=('babb324689ef80ce0bf07ad2bcad4a30145a38e6e518156f01e24935b01d3038')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
