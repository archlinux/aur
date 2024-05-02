# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RbcBook1
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Support for Springer monograph on Bioconductor"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
  r-graph
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('592752ffb122c529b15fcbcf09003a6c')
b2sums=('9ca8b9ee8a617267a385688f137d85fc82118da67debfc537d9b95bd1e8cc9b6adfbefad6bbe9f3650ec8318a28fe01cf6265fadd918b0b4b01e9b325fda17d0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
