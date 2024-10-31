# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=xmapbridge
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Export plotting files to the xmapBridge for visualisation in X:Map"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-rcolorbrewer
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e7eb4c88f4e7e8b2dd65ffe8acc7014e')
b2sums=('f46e4f7efa57466ef1242de4ad009c62d26a63b6ef760e4c5cb432da78c5b7f531376e435995912a83fa8da1bc56c39c554823b3d34db23773f895e3713586d9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
