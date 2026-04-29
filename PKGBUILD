# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ProtGenerics
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generic infrastructure for Bioconductor mass spectrometry packages"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9a44e97ad352404e76f9f21d4a801aba')
b2sums=('66573da1d189a3266dcc2fb5b42efe0d55846c1fc1deb0ce9001d3e95c2745ab286820d635e32d357d14f9bf82e11e36347e8d88fdf34b027a8963c037192fac')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
