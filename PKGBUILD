# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=factDesign
_pkgver=1.88.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Factorial designed microarray experiment analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-biobase
)
optdepends=(
  r-affy
  r-genefilter
  r-multtest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('63744ad2a9a346a5f239b94940d895b1')
b2sums=('2a2b9a227af5c0254f697aa99b6fa5b5ed17b2db414825e4a4a06dfe4c4ecc4b0d9b353d6ddaba5337d20c02e4726de7b815985669034e6c48aa84401fa3abb2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
