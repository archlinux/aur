# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=snpStats
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="SnpMatrix and XSnpMatrix classes and methods"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocgenerics
  zlib
)
optdepends=(
  r-hexbin
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('812b41afe81957274912d2656bfe90c2')
b2sums=('bac7f0baa0624cc9f8144199fa696037603aa6b88aebcc68f54ce36563e1aeef0917a97c8c5f5fe4e2b7913528a18e8704ac21e2996815bbf97d555e55ac156e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
