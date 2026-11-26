# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rgraphviz
_pkgver=2.58.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Provides plotting capabilities for R graph objects"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=(EPL)
depends=(
  r-graph
  zlib
  graphviz
)
optdepends=(
  r-biocgenerics
  r-runit
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0c4337dbfcc1d22117eea49103f4c1ca')
b2sums=('a73b79de97a92aebbd4a965b1a365530d83e5fd39a16305e018a238ad7bc959e0f45ab6c5ec47db28940a41198e6dfe12c6c2ca1f4e2006277a6d446f807daf3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
