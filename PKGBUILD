# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RGSEA
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Random Gene Set Enrichment Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-biocgenerics
)
optdepends=(
  r-biocstyle
  r-geoquery
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d30534249c122fa72b4f17a7e2ca1513')
b2sums=('3ddd50b20c81848dd7b91e2a667796af23f48b7390c2399b3b4796cb4c172766550326b6a5471b32e54cf3389f802ea704086bb868502a4ed80dd81c03a13509')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
