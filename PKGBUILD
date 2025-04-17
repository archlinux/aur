# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hopach
_pkgver=2.68.0
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
md5sums=('c3e21e2bd39d364244aa4345b0620240')
b2sums=('eafe17f78b4583d7123979e81b562dcef812ed8faea477f5f7ef1ff3a90dad25a16a1f64dd83636f636f28f7a0138aa7d5cae177c851b949db622b8e72a07266')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
