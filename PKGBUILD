# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=goric
_pkgver=1.1-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generalized Order-Restricted Information Criterion"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-mvtnorm
  r-quadprog
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e42b0e5b661343077271b6653e84c91d')
b2sums=('03b4aa1a21db2caabd3343fdf4d44f17b4846a5e8333000397b5644531d0ff4201fe86c6d017f13e4da58ddf76d4d348a74e1b6c93069b98a001456a79f6cd95')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
