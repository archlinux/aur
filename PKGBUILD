# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FIs
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Human Functional Interactions (FIs) for splineTimeR package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ef807b75136742a1dcb5ea70993d5c38')
b2sums=('c9a0b32cc5d7a9119a36a943e1fd66bf50f801b0c870ebf11f334cce331ab1e45bd392976a04d3c888bd98f96888c940fc3c980cf833d1c864373ebdb74216fc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
