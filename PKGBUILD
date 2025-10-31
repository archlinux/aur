# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BeadDataPackR
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compression of Illumina BeadArray data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6a02231bae47780f26f0f0c753188d35')
b2sums=('737543c2f0952ba29232f855e7363d983c3ab35c36c7d85f374e1dcd663beca2d4eaa90427becc240f2f0586db1e1b1ca6a6c01d5c31d406a9c72efce9725c8a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
