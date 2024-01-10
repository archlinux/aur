# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigmemory.sri
_pkgver=0.1.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Shared Resource Interface for Bigmemory Project Packages"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only OR Apache-2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cc643b29f763b8e1381f5130023861c4')
b2sums=('c989c6afdae04f710731f2db7f177ba864410d000bf0e4f1b151a9a326fa192e8e78d16317dc76f2fa6c505ea79c37f395e4bc60c426438ca3131a1144618682')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
