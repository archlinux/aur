# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=copa
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('11ad10f59dee1224bb06852c355598de')
b2sums=('2f41fc53c6069c46433c663c0d06682a6b3058af5b0cefd4e6d06bde73490f85eb0e9222bd98e071f50d3b297a081607e9b10c116fe1b5c763b5c749b9ca4fee')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
