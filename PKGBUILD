# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=preprocessCore
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A collection of pre-processing functions"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  lapack
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('64be2ce41f03e5b3baf3872602a90642')
b2sums=('ef304afa93eb391115810e2a14b3a9b43b7e6dbafda4be6a9540817431ac93ee0adfca01f8ef0223fa7772c1da1628422cc57514a619f687dcc1d3d3508afd0f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
