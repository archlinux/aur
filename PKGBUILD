# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BSgenome.Hsapiens.1000genomes.hs37d5
_pkgver=0.99.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="1000genomes Reference Genome Sequence (hs37d5)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-bsgenome
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('164e1692d38fefa499c2c8ac5fc22793')
b2sums=('274279530659c126acac8ebd3fa4c4941d853b35857d47439991a1821acd5a269c1fe334cb6909cfc88e4f36c118dfca520a9e3681e5ba7f32af8f1d9922f1ee')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
