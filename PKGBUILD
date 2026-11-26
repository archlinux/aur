# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocCheck
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bioconductor-specific package checks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocbaseutils
  r-biocfilecache
  r-biocmanager
  r-biocviews
  r-callr
  r-cli
  r-commonmark
  r-graph
  r-httr2
  r-jsonlite
  r-knitr
  r-rvest
  r-stringdist
  r-xml2
)
optdepends=(
  r-biocstyle
  r-devtools
  r-gert
  r-rmarkdown
  r-tinytest
  r-usethis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b142b00438be6c0b6a48626f38229b76')
b2sums=('582f1ad9a6bb04c3d3ed9fba4c1d58a5425488bf2fe58322fa50e3fe088a7070edcd02b9c6b70df38154702b29cecb14c6e24b0ab6de10f9b5fcdf159ab46025')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
