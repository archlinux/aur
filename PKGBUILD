# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rgraphviz
_pkgver=2.54.0
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
md5sums=('7c56d75e456cbb5772ce70e28f252b49')
b2sums=('2826f155311934a179fac5502d84e42c3f5e36aa89cd7a4d0ea9cef90eb511a1f28ffb0664adc497e4abd322ee69bdeaeabddef593da654efa26e1cf364c05eb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
