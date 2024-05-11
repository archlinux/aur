# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=QSutils
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quasispecies Diversity"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-ape
  r-biocgenerics
  r-biostrings
  r-psych
  r-pwalign
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e22810c5de4ffad732597e641c47b875')
b2sums=('f3dfd16562db0643d532e67df559131caa6afee60cfca44fdd185b72b95fe782a850a1ce594c823556a1ccbce4654caa57c2d9d593a755a931c73b41a6b5a3c1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
