# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rhdf5lib
_pkgver=1.28.0
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
md5sums=('2038bed88d3c7b81f8cc9caaf0b0a068')
b2sums=('72d47ea6ee9d2211174530d168136013bf6f32d2724c3a3df6cd766a9941615b95a59443c1045521ee47df4da2d3341052b2525b457437e4175b018b42bf4651')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
