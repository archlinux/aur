# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ITALICSData
_pkgver=2.50.0
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
md5sums=('85c8ec8c3d54fa2910c3021a7057634f')
b2sums=('1225e891667449ad9f6a2619bec7e54dd69064eeb03c53c2adec54c936be0474bef8455058ecc719d3d6d2e0a3f704b17c8249c7b9e275f08225bbb78dc3930f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
