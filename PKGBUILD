# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cellscape
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Explores single cell copy number profiles in the context of a single cell tree"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-dplyr
  r-gtools
  r-htmlwidgets
  r-jsonlite
  r-reshape2
  r-stringr
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('885d45707813e1796ded7803bf64331c')
b2sums=('c0427d99b02d5b8834c9c7734ed1ee40c79b660e5c993129dffcd7ed104aa4c5881a212616cd13f3c43798cceb206c906821a07fbe734ed33398aa63b518b464')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
