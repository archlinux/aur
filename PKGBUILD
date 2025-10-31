# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sizepower
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sample Size and Power Calculation in Micorarray Studies"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2f7becc1e00815f39c059f2856d7ee4d')
b2sums=('13013b34f21d984af5befdd7d31c14202bc4c8a06f9d3ffddc3bc4ca9bf1b475b770acf75c7a65182afabc094c7bbaef604afd021909d538da18d9723e758aec')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
