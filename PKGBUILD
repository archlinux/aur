# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=flowWorkspaceData
_pkgver=3.24.0
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
md5sums=('d78c083755519a4eb5967a586143cd46')
b2sums=('acfc256daa8ba9bae27b9f891a737e1210c089c321a965adea87cb4c4beb6cc7e1aef19f1f21c06bba90895654921cded96d9438bf6cc42e2511b15672ae39fc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
