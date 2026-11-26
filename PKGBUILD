# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PROcess
_pkgver=1.90.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ciphergen SELDI-TOF Processing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-icens
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('61b968f81bff3799a2aceac8d32a4581')
b2sums=('00fd66e0c54df10733912ff16cdf7d5443354916bee1bc346a58a83c018e7ba58998f16c79e2edce7018d94b9af4de3800d8f45d8081fba3575f27efbaddcb99')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
