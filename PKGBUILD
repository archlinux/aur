# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=flowWorkspaceData
_pkgver=3.21.0
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
md5sums=('7f18f05a6cc28a35c52dd7ee63f897d7')
b2sums=('d8394349b9fa68dc2c5b0202354f878e9132c98e34458748798b90e3e468b9499fbc9fa58ccb5c417c68b353ff4f00f553abc794be1b54d59e46723bd37f84be')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
