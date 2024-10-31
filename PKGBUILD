# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SamSPECTRAL
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identifies cell population in flow cytometry data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dc3da48feb16c796c61a290b9e10708f')
b2sums=('6af1c95c1600738afbd53adf5380e6cd80af3b7e19521c9607cd6897d78ec8f1861aca530b2804a24c4bcae1750319b80ec1101d1d9b28a95766d73439213a2e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
