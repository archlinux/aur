# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PMA
_pkgver=1.2-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Penalized Multivariate Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2c01838f9dff435f10538c623a46e1c8')
b2sums=('f8b092ba485a1ece902e3d30ad209bf9b358aa757c117d562a9edc15d755c8156d756c45d0fe6680005308fd499764447ea05a44598accb8ae73b6cfd0e93290')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
