# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EBImage
_pkgver=4.56.0
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
md5sums=('a917eb03ea7e8daf45232270c4933f40')
b2sums=('1c0ae560baf33af841acf9363c3313968010ddbff5fca8414805bc4fd4ba263f6c2e1cc0241ada1de455ec38688d911622e74248921d0405a5405f2b87569acd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
