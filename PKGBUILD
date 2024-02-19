# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EGSEAdata
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Gene set collections for the EGSEA package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('CC-BY-ND-4.0')
depends=(
  r
)
optdepends=(
  r-egsea
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('838b30ae6caf7c3cbb854e0404b52cda')
b2sums=('77dd8b1316b1139b3d4f5815aa31a55f9634fe39cbab027ea677394d2e12419e3a38b6b11cfa5c4474a608d7993fd7402c12a3fd4a028ed051daeb75bd01fffb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
