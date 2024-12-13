# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rhdf5
_pkgver=2.50.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Interface to HDF5"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  curl
  openssl
  r-rhdf5filters
  r-rhdf5lib
  zlib
)
optdepends=(
  r-bench
  r-biocparallel
  r-biocstyle
  r-bit64
  r-dplyr
  r-ggplot2
  r-knitr
  r-mockery
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1f9079e44c5aa27a88a7d06bded4202a')
b2sums=('9d9b150bc32a3902b76143158ae5ebb86bb1ba0219cc6319aec7f2401fe8c2807778305ef477947d9df8ae1fd2048e3abbf4e605e14f7816146217f2acc06e61')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
