# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hopach
_pkgver=2.74.0
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
md5sums=('985cb11495cb6c0f29c69f7fe3b00404')
b2sums=('359aa06e1442c37ce29d107bd8e4b6bec10b8e18ebe3d2cb5f3f6ec16fe8c50d36a7de14268ec1f5cf527412b674eb6e22e70921629bfe5d25c196097b1736ad')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
