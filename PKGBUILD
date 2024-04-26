# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=org.Ce.eg.db
_pkgver=3.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('441a5efb4649a1201b5552b14c1f1cef')
b2sums=('b34a4c98b3af98986c2448900c4c1f80c92d1b1350313f12bc7c2bb039393f9391c7c090bc814c9191c37ddc9007298e2244b68a126475f6677bc4d584e10087')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
