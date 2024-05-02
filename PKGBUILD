# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=minet
_pkgver=3.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mutual Information NETworks"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-infotheo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('14157fad48dba8ffef803809737ccc25')
b2sums=('dc89338d188cd1f2bc2ba0ab04f251cc82e0316ec9b8b428f4f8302e1ceb16ada135caec2c828641b8860b83f18d7284f2768b8f0f03264b6913591b41f53f4f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
