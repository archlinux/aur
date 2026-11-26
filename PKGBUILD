# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PathNet
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for pathway analysis using topological information"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-pathnetdata
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ce5eebbb75395b5a598aff6e1d475955')
b2sums=('ee80fde85d82add0c743044539d593ea84b2791708eff136e0921ce08bd7826b2564b43d4c11899807255396ebc52c7335666dbd2c429f21fe7c08e132aed943')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
