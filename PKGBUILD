# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ALL
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A data package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('52da9b3d490b403f28c1507b7281ea2f')
b2sums=('eb613b6eee21df98e5566e03f833b2a4f0dd49cfbe8ba3f08c10adb225002b02c1ab3e9a6698d5ce02b767e115a5b10b21fe52f70798d34f79ebb4cf20835721')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
