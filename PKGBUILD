# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqmagick
_pkgver=0.1.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Sequence Manipulation Utilities"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biostrings
  r-magrittr
  r-yulab.utils
)
optdepends=(
  r-downloader
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-knitr
  r-muscle
  r-prettydoc
  r-rmarkdown
  r-rsamtools
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e2923b561cb82289ef07e4016f7376ad')
b2sums=('e1f23726164157cc14cc1cda6df6ea6932cc8aea3474cedb79b44ede34c3ce2254eb53f4f3d6982803ceedb680c6993735b569a0279e586f319603b45b5142d9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
