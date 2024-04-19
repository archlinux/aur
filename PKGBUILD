# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gaggle
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Broadcast data between R and Gaggle"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-graph
  r-rjava
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3dc385e959f454cd56dec418800c33a6')
b2sums=('28bfbb7068bb63ab076e9a5a66e23f0eafc6f0bbb905215ddeba0cccff49694b8afe662c54a83293b4bb76ad31129330b7b68b359c7173a2008e6f2a5495cd98')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
