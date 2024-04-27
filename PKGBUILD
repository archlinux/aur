# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EnsDb.Hsapiens.v79
_pkgver=2.99.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Ensembl based annotation package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ensembldb
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('16b5629805c07649b2aa501d34fcc588')
b2sums=('bb754176e749805ef2c8199a4abac749386a2fd9fe146fdb422f27b50b0cca17e4d7b20b42f63555a19469cb51bcc055168f3551829eafb81b5b3e03b6476370')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
