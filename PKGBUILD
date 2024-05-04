# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ITALICSData
_pkgver=2.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="ITALICSData"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d7f67b0fec76042472582465864e4178')
b2sums=('c3c46cb6419a8395c29bb5eee1b9dd2a658b4bff43150339279cb12d63b9008d5bffc02e7a78b371e863edcdf5ff5eea76a387f1aad2761b81bc5b5016228132')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
