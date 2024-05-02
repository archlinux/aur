# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=h5vcData
_pkgver=2.23.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Example data for the h5vc package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-h5vc
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2882496120c7e2918c8ecb449af18567')
b2sums=('59b587fa10bd2879e8c2605f95bd856cb1260583c52a2e600679e008c3e967daf90d8ec37df2a68d5275d719bd153c48fb987f50ea73db5021b5a223208217f0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
