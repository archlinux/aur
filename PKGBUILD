# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rsvd
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Randomized Singular Value Decomposition"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-ggplot2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ca5ad07f42daa6750d84377e9c1d1f0a')
b2sums=('57b5a98640987d5eb879ee51339e022ec59b786efd883753efdecfbdf7a54db41603fbbdc668ab6a989afc43397248dd6f47746d47c7f580fcfb133d262c60d5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
