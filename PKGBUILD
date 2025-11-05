# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRcompData
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data used in the miRcomp package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4f6cfa622a54b3b796e26ab9db62fcbc')
b2sums=('a240264c0d6442c91838be5a43d32765222dd2d3728ecfbdfee140a5c9b4d0b645fd00ff2bfa8130a17bfb684d4bf6bd71cc12f3927612fb51370cb1facf9a99')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
