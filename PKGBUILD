# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bioDist
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Different distance measures"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
optdepends=(
  r-locfit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1193ab349ebf6035113e3312787245e2')
b2sums=('effbd9f6c03fe9a7b4ec532aec4b2c0d4ebaa2d18271b642e3972dcd719000f572948fb1c9e6c4e86f5b98b64fcba3ba9497dd26b1d2820a48cd7b51c16c5db0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
