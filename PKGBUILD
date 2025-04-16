# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=xmapbridge
_pkgver=1.66.0
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
md5sums=('b9aa83ea3bc2f1c97b68ce73721667d1')
b2sums=('4a12455ad92bcf2ed942cce87de01ed4c9cb321c5726ef734642b86b23d0be1c5f10bf9834256e603ce7c37e18d9d4ed515ec62143d54230183cc224fd21f08c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
