# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocCheck
_pkgver=1.44.0
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
md5sums=('133dd01968bd77fd4faa0fa59bd5adb0')
b2sums=('3f84d674bad780ee32dec94648a4e808d3d708b11acb96bcfa5786d7ec171e385caec1a98501131dbf653bad48c4aafb8464a643a6a30ed21f16fa716892aef6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
