# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocCheck
_pkgver=1.42.1
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
  r-graph
  r-httr2
  r-knitr
  r-rvest
  r-stringdist
)
optdepends=(
  r-biocstyle
  r-devtools
  r-gert
  r-jsonlite
  r-rmarkdown
  r-tinytest
  r-usethis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f1e103257209aa3b49230fe84a3af711')
b2sums=('17c84719b4b0d671e615219d7e50c6ff859251c869e9d2385f536d038091e4ec62d796ba1389aa52f9ce0f5eeb3fe504912980401e593a3fa459b0575699a53c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
