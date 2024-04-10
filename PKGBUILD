# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=goric
_pkgver=1.1-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
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
md5sums=('30e6ca89bea0e0d0c1c505d90c707aca')
b2sums=('149004d847f1126f7a8f19a663a61d376b23ed4d617dc3011ba1e56525a1a69872738963dcd62e26176124f9cc1d0b75a9c2312cda30fbe726295298cef7ef6e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
