# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ibh
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interaction Based Homogeneity for Evaluating Gene Lists"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-simpintlists
)
optdepends=(
  r-yeastcc
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5f38af9a485db49578add644fc18b2c3')
b2sums=('f2f95cc124b738407261b7ca63d6cae9ed9bdebdc1fa2d8220552155f20c505957cd415aa28232c6d78aaa56c9224889c6ce584795b1b25d41e2aeb376e3c976')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
