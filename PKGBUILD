# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigmemory.sri
_pkgver=0.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="A Shared Resource Interface for Bigmemory Project Packages"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only OR Apache-2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c9e558480d17b5d5abaa3fc8fa02fde6')
b2sums=('50493caa6334f9719f3eb6142394fd43b795119790f221123ef1e26b27d30cf09caa5bada455f3fa927e86ee4a526d8c3c5ca9a31cd310b77581b83d29a411b8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
