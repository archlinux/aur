# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=calm
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Covariate Assisted Large-scale Multiple testing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9a2b4c48021193636c88c997331ede2d')
b2sums=('220688663275c68e39e6fbe7fef558da6e6761d067aef930d91a6e802c4fbcbdebea81366aa838355ee08956e330789b8337afe1359879f032d0fdf5c2c610f1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
