# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RbcBook1
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Support for Springer monograph on Bioconductor"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
  r-graph
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('16f681613c1c4d309b032c64cfe18c4a')
b2sums=('642aef837aa7a54f5e45af3e1d9734baa184489685b75ad005b1c187b29a832a660541a074bda00d7670ea88ec4793484f7d5d66ec57e48daae3239d44913508')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
