# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spkTools
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Methods for Spike-in Arrays"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
  r-gtools
  r-rcolorbrewer
)
optdepends=(
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6dd0ebdab2915c8dc2a44305814ea577')
b2sums=('c1a75d606d8801c4ec68c09274051bb83a61cd87cf38f284f1ce209acd97b1dc8c9fb129b19d0ad7927db98010fdae86dd132a1a6e840c8913d825482104d478')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
