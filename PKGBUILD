# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tRNAdbImport
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Importing from tRNAdb and mitotRNAdb as GRanges objects"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biostrings
  r-genomicranges
  r-httr2
  r-iranges
  r-modstrings
  r-s4vectors
  r-stringr
  r-structstrings
  r-trna
  r-xml2
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-httptest
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e5fb868f068e6fdd0b4843dad7148c33')
b2sums=('975dade6ef526045ab03738e5fc4aa9c88f1dde80dc0e2a8ac6caf7cbbb549e82b2e10ff88d936a3cbbab34e199fdfca65702974622e47aa88dd4cb7b4b95535')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
