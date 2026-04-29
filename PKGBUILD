# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cellscape
_pkgver=1.36.0
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
md5sums=('eb2f59a39039c4c008145529e33f157e')
b2sums=('b914824a27a357007d482bfedd1cc29a72d6c5c79a2b35a46224112bc9de46687e70c742ed9f2e95790f478eedf0f195c9e8cc0f6e8ad7d600d72361884444c4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
