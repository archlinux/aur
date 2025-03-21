# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proj4
_pkgver=1.0-15
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A simple interface to the PROJ.4 cartographic projections library"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  proj
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f5ed50ed6f9d7aae15d7a01b8dedd207')
b2sums=('ed17a4f4a01926f58a3dc7636282af10704e07ad52e258772de6b9524b6190055a35967193478514e74308a7fb880a82af09cd4a02f8fea9939da1b943ffcb94')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
