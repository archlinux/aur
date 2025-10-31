# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sigsquared
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene signature generation for functionally validated signaling pathways"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0cb8e3d7673ce095f76ee87c7ef069ff')
b2sums=('b06db3f162ea8ed90eaca545675f876a3ac51748852be316277e47d6b959ba38bf9f9d57ea566495b6affe2b400bde909943d83a052011ac3982fa82bb0db656')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
