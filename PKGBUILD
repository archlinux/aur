# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=org.Ce.eg.db
_pkgver=3.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Worm"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-annotationdbi
)
optdepends=(
  r-annotate
  r-dbi
  r-runit
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('441a5efb4649a1201b5552b14c1f1cef')
sha256sums=('b8b06a6ebac8ea36f643d6dfb3f6a486a7d4a20561a1bb74eb424de3d7ca4bbb')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
