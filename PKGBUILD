# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RedeR
_pkgver=3.4.0
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
  r-markdown
  r-rmarkdown
  r-treeandleaf
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b864f6f8dedde0a2fd257c725dde81f4')
b2sums=('35752d6e4703dee71353010e698ec8c7d56bc9054cd7f7a470159fc9e3bb22e0b7994499e6837fae372cae1cc7d9ae7ff7656d21d7e7efec77c2018817d384fa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
