# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=coGPS
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="cancer outlier Gene Profile Sets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-limma
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('24c06b97648ec7877c93dc5c8a98240f')
b2sums=('d2a46d120708e8e9019b2d2cfae78defac45e86daf05a17b48ecfc4bcaba001502220f7dee006d0e18df0adb79c9974af0c84d7e897d1f2737a8e9b2791f37b7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
