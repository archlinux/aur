# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rook
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="HTTP Web Server for R"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-brew
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e78c29afb2968412165d8bc45f13a452')
b2sums=('d31ded93a6ecf04e44259e8deb6191440a30baa46e7985e6261f62550a72fcdc9aba39df5ae0d9a9f4a8300aae18ac1630eaf4c2c006198e4dab1b28427967b4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
