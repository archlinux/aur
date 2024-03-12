# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aggregation
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="p-Value Aggregation Methods"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ef514bc6eee647289efd96b46dd26e98')
b2sums=('f46fddbf8294c5b2ee7c040a29efa3e650efa41824f87be965bde53e8036f4799fd93300e99f26beec3d3dd699ff2cda9a8c7516be5570b8351ebab21e0f7296')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
