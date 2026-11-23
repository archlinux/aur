# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RedeR
_pkgver=3.8.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive visualization and manipulation of nested networks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  'java-runtime>=11'
  r-igraph
  r-scales
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-treeandleaf
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4407421a1da4dfce1f67595c2134bf5f')
b2sums=('4c43f7821bf5429d2f761f1bd2007ade545f5922b79f9588e4ff79da686794a11e68dd505eeb7d7827bb2f1f6e6ed728d5c2bd0a7efa655c0d9d880f4ad92484')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
