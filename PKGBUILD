# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EBImage
_pkgver=4.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Image processing and analysis toolbox for R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-abind
  r-biocgenerics
  r-fftwtools
  r-htmltools
  r-htmlwidgets
  r-jpeg
  r-locfit
  r-png
  r-rcurl
  r-tiff
)
optdepends=(
  r-biocstyle
  r-digest
  r-knitr
  r-rmarkdown
  r-shiny
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7a6be1bbd38279542fe0f9360674a80e')
b2sums=('f6e8d1000b27b1464de3aa69ddc231999909869519c33644dbc519b9d22562ff173838fb28108a71032c4cfa576763c0010e6f315406f7b40037859ca8237906')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
