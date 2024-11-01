# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stemHypoxia
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Differentiation of Human Embryonic Stem Cells under Hypoxia gene expression dataset by Prado-Lopez et al. (2010)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('49bf6a9e4b05c1ae7841672ab7484457')
b2sums=('a4caea2ac33f489e88123cc29c7298ed735e47a265d9b71e1324c345831bbdcab006157e3b8edcbcacdff8dc06b4c9a36ea1c2e2c403008095e4aa7b570e5c5e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
