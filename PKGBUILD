# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=simpIntLists
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The package contains BioGRID interactions for various organisms in a simple format"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cbfb771fafc6a47521736aec605b55e4')
b2sums=('c0da971ee488ee60e878cd0a838589646d51d018ecd24a8ca943c0b023bbf1cc84aa0aa8852e62ebc2d6c4b98b1201acde84d9c70fe54d791670c63a6046d9af')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
