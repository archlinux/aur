# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=profmem
_pkgver=0.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Simple Memory Profiling for R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(LGPL)
depends=(
  r
)
optdepends=(
  r-markdown
  r-microbenchmark
  r-r.rsp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f67828b0287e8ca8d244982cc6c171e4')
b2sums=('ecb07fca472cdc482f238792a3e8c0f48fcfda36534f3f2f5720d911474e7ac9bbd6ebc7ad32b2a8280534e4cf26deeeae3532e2af67a91f8cdaa0a918cdb7ce')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
