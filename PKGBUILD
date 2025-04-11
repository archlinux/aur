# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=startupmsg
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Utilities for Start-Up Messages"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2c45703069072e10978c005d143366fd')
b2sums=('378b191fe50987c3d1c57b8fa431336bb8aedba7dac4e529bca57c3955dc8af3bdd243a1cf09bcbca051eccee51d643c16da517625326be61f4a60c75834c3ca')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
