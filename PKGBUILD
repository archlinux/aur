# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=copa
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Functions to perform cancer outlier profile analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
optdepends=(
  r-colonca
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bd372714a4dd7e70b90d9232fcba322d')
b2sums=('4f9b67ad7242ac163f628a6458765e293f45625de81ba0a26b97f2963684cf317b8ea43742efbd0dc711a3b470b3099b2757c46b51ac44707e531172b58a940e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
