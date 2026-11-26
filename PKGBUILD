# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=factDesign
_pkgver=1.90.0
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
md5sums=('a6b048a6302efbea3b9201398b49f88a')
b2sums=('6c61f7eabb3689c8669dd5a3c3363876f37a7cab02e5c3b297f5c316f3d4eb8399e7fa8e017b2bbd59676c44dab3ec0f7f5617bd8d1c206acee5287cf4bb56e2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
