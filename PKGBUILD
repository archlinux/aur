# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=scs
_pkgver=3.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Splitting Conic Solver"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  lapack
  r
)
optdepends=(
  r-slam
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('90d47bf8723da0545ee1edbd294cd4d6')
b2sums=('ef5e092b2977adfaf83de0fc499d81a0f21e68d964e3a8b07b3af25d56c47ab6398da18cd553c26863bd352b7552a4ce3da37fbf4a09857c6905cc9fbcd0a767')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
