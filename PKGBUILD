# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DAPARdata
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data accompanying the DAPAR and Prostar packages"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-msnbase
)
optdepends=(
  r-biocstyle
  r-dapar
  r-knitr
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('66542a4da72e6be471144224bba6bbf8')
b2sums=('b7b7b6588c0f10ccaa1b52e1e02742f53d367eb733166e6361f2706b0745f658a65240f34383e8f3b691d989d9bf0493fc4914b4b2cc301a36d2b19e582272a9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
