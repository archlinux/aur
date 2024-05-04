# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HSMMSingleCell
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Single-cell RNA-Seq for differentiating human skeletal muscle myoblasts (HSMM)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f922f7dbe39fe76fbe071d39e43e204c')
b2sums=('db60372358dc8b6c6719f029373e09794e4e435d0c2fcb778457f60afa3921e71d4a50ea5151be4aa34f4358eb7e5cada2bf26dee4c950db449500c98561950d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
