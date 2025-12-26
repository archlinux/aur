# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=org.Ce.eg.db
_pkgver=3.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Worm"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
)
optdepends=(
  r-annotate
  r-dbi
  r-runit
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e57ce3ebb7c2e87073b354db70c41c83')
b2sums=('d7a95c2291fc7f445cb30fb57b27ab502df5827b3800ac411bb19ae0d58ec8cf347526e31b85a6f9e753a43e582de4706890066310ffc87291fb4971405d52d2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
