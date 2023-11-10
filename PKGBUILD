# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EnsDb.Hsapiens.v79
_pkgver=2.99.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ensembl based annotation package"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-ensembldb
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('16b5629805c07649b2aa501d34fcc588')
sha256sums=('eff1ae8d7f4ed5c6bed335de63a758be593750fb0b3483c01cf50402688d244d')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
