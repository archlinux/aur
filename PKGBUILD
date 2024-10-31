# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=logicFS
_pkgver=2.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification of SNP Interactions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-logicreg
  r-mcbiopi
)
optdepends=(
  r-genefilter
  r-siggenes
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1da216467b438745e9929edf5a695237')
b2sums=('2e97e69508f59be4cb64adb7bf14ec3d25ee6df628a0b1b8cc0b5fccc5943c296e0fe601d25a81ba7651901737019915bb4120ba06e1088c673b0ae7603b67fd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
