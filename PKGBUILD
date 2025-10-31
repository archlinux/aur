# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=xmapbridge
_pkgver=1.68.0
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
md5sums=('18843b2f9aaad8373bb230e3e0a66a57')
b2sums=('6cbd3ee3c053bf69912f21d2e073c0a068176989f478cc1e67a480ac60ef0eed1d3e64f31de391c7fc282016ccf3c7288eb51c2838aeb14b53c12c444b417868')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
