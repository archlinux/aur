# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LBE
_pkgver=1.76.0
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
md5sums=('d3e3bfa07096672963b6dc4e69d1de35')
b2sums=('df2dba2b04551dc8efe2d8afb590dcd3d67761d30509039e1e17a211e1b3f39604bc6cb60a9047f39b3a6789e3460911f258356d4a80135bef21c1a39e13c2bb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
