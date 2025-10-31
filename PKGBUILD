# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LBE
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Estimation of the false discovery rate"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-qvalue
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8759cb212ff13108aa4a0a8d9d4b45b0')
b2sums=('a549b7cc90f1562443e81fc8e6a69d9019a99d001b56efb98bfe5885e341f8685f1deff9584976c5fe87b9baecd5dfc3f8ee6862553e824dda69ef70184e7fce')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
