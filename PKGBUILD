# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sigsquared
_pkgver=1.40.0
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
md5sums=('c79a5c0cfdfb3950633705d5bfe6dbd5')
b2sums=('35bb28a31575637221a3bbfce35b17d753a88910a9b49a23789bf67a484310e21f7a1d2a7ea921d108cd308f820e7a0fb36614e1a206a2ab7dc7fad399d03944')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
