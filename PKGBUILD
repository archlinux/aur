# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rhdf5lib
_pkgver=1.24.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="hdf5 library as an R package"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
  zlib
)
optdepends=(
  r-biocstyle
  r-knitr
  r-mockery
  r-rmarkdown
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d350d5309740f184ad4eec7cdb6d705b')
b2sums=('b4e7c544f408f8d2cb960ee2a0e05cbc638eef6d7f55c12fb28f7d14857eb9830aaaa5d2aae847183aae51873f7ce683f10142e3f40bdcef753f86623fd36b60')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
