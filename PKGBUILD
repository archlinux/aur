# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SNAGEEdata
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="SNAGEE data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-all
  r-hgu95av2.db
  r-snagee
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1cf627572ff931f4f14c3d189b39972d')
b2sums=('4c0e5ce685133822d543fbd6a50857af09cf965fbcfc65f0531abb0c71588119268cfbcc90ad2c0eb4d232a6259add01473f3c2f5d7099afdcc47141f6c8ac99')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
