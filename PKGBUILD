# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RnBeads.hg38
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RnBeads.hg38"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-genomicranges
)
optdepends=(
  r-rnbeads
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bc0a6b6c9dae6663329d419b38112e0f')
b2sums=('d1e4fc11a94abd231fbc3a39b432684184a3576e93d8283276dd52dc7aa9110944b50507ca19ef71e77f7a31610e5e1c3d7eb9e2b1751c4d68f0f7ef62f7f1cc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
