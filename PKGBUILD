# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RBGL
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An interface to the BOOST graph library"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-graph
)
makedepends=(
  r-bh
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rgraphviz
  r-runit
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3c15ded2511af5c004e3e541d1a243f8')
b2sums=('d0450f19e0a30b2a08c177cce9a13bb500b264f43218855941a48cc26a67a8d67be5dcefa2e857cf391a68772242bd3e4886696e9cf9baf5ed62fbd86061628e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
