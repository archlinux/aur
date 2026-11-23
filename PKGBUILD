# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=Rigraphlib
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="igraph library as an R package"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
makedepends=(
  cmake
  r-biocmake
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('efdfd93d8a70c0bcc22eb7916dba79cd')
b2sums=('e9cd9d69af440d0e72004d114b92e762cfd78b20e867ca6fe3eb7d070dea37cf5d67ef935c0303102b812bca7102043232b23348c3a3266ff9e3ae2766ad97ec')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
