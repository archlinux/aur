# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hopach
_pkgver=2.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Hierarchical Ordered Partitioning and Collapsing Hybrid (HOPACH)"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
  r-biocgenerics
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fb6d52fa9f317fd683364b7acfaffcb2')
b2sums=('db5aa70ab9a45448a1ad4170cc7dd6437c9f251dcda052c24c5cec77afeb5ec728cd4a528e712adae06f26a0c51bb00603029a44c52b1d7f742119d8cc187850')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
