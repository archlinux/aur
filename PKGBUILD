# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DNABarcodes
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A tool for creating and analysing DNA barcodes used in Next Generation Sequencing multiplexing experiments"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
depends=(
  r-bh
  r-rcpp
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7922c9dbc0b216fca9de9a18afef465a')
sha256sums=('6abcbcdbbf7221f6d1fbdb0f0ff12d32225f7019cf09b1d650787e912405dacb')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
