# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clue
_pkgver=0.3-66
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cluster Ensembles"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-e1071
  r-lpsolve
  r-quadprog
  r-relations
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('26a78e428a10f61bdee5affc4b0679b4')
b2sums=('6ac95fe2679afb7e5a4612b9d5a3c76f44625b9ae224ef4c52debdac251379dd1bbd907fa9f6053e29c381a9917a1152b187fcdaeae8f1edaebd757fa2975bf2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
