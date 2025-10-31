# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spkTools
_pkgver=1.66.0
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
md5sums=('1e489060e20484196652f04d3f2dd083')
b2sums=('c5a6e94062d06688a1f8274c8994cfff05df70f24dc53f376252e0ea3fe03268f8b3d14705815221b5c298093d501889df6a27b9d25a572dce83925e5612981e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
