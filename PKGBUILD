# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=N2R
_pkgver=1.0.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast and Scalable Approximate k-Nearest Neighbor Search Methods using 'N2' Library"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r-rcpp
)
makedepends=(
  r-rcppeigen
  r-rcppspdlog
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b3d43a66bc38311a9fd470114306967e')
b2sums=('3776ebae6cf6493842cd17d6dec7e43c959df65ca4e5e421a0c08f88958ec770a5f18b2fbaa3d12cb624dff241281b4aca2826c4b87acfb1f7b5cd673c8d7df0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
