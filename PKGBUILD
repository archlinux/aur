# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=awsMethods
_pkgver=1.1-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Class and Methods Definitions for Packages 'aws', 'adimpro', 'fmri', 'dwi'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('82c6830885e741c53357767582eec709')
b2sums=('69bb919c0cd5aa5c01516f07557ccdc735a1643055471e67157b49f374656534e04b2920e5121d503f5081d5dd537562df9398f8f9c02d139c07d7afaeaa715c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
