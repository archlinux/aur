# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=praznik
_pkgver=11.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Tools for Information-Based Feature Selection and Scoring"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('52453daecb6fcf6cae694d00cd86006f')
b2sums=('0c38ab05d2472ff91a4e3e9e185776d995b9d563ddff813d897c53165422c1f92d84d834ee1e94f4c9e9e1785f57ce16d0f3d7576c8571544b26f54601f3271e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
