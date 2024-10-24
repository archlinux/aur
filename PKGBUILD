# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggfun
_pkgver=0.1.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Miscellaneous Functions for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-cli
  r-dplyr
  r-ggplot2
  r-rlang
  r-yulab.utils
)
optdepends=(
  r-ggnewscale
  r-ggplotify
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c7a8ccf09c03f0790ba9e9b1b3f50d55')
b2sums=('fda029e33b186d7f75c461bb820116d3ad21d31bf28773c053af9b706b711a5822ee1738f539f3afa3195c7cf0dcd02df75d5eaca876fc72bd5ae6f99b664835')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
