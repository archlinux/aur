# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seq2pathway.data
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="data set for R package seq2pathway"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7a78db6fa35357ab7f148785eafee6bb')
b2sums=('f7602ce2520a95a28c3d8651d23afd2a3dc3faa657c3f8a15f2be74584dd555c71ff4fddd36b67d4ee9ebde2a314413c1de74a688246dd97183ce7177a090725')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
