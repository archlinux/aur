# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EcoIndR
_pkgver=2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Ecological Indicators"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-fd
  r-picante
  r-rarity
  r-splancs
  r-vegan
)
optdepends=(
  r-alphahull
  r-geor
  r-plotrix
  r-raster
  r-sf
  r-shape
  r-sp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1bb0e62d2cfb2da1f626240c3e6ad4b7')
b2sums=('af9fc281d4426b144de7be17df258daef3f7749476377d5074956d6f5a033599608075ca552b224cfc80ee9496ff068dd262e074a1b56a3aa91732407a980bff')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
