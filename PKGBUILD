# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OnassisJavaLibs
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="java libraries to run conceptmapper and semantic similarity"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-rjava
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('83d6c9cd10ce071ab57a695154638007')
b2sums=('61b856f8f0d883536f125e5bc8824766ea22e9953086f68dda5b846408ef9a7da4a71163a7d2aab53da93e924b2bd797e18f118497d905d6f2ad7be99378f23e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
