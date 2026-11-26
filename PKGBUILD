# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stemHypoxia
_pkgver=1.49.0
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
md5sums=('dc7a58f94e8f94b4e30aaeaf92b273d8')
b2sums=('f743df16f1cec3226e0795328190b53fbca6221deb8728a4186396dbb5038dbcba15687fcd6b408cc2aabe1bff2255214facaf5e693ad48cba4d962d0931cd6c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
