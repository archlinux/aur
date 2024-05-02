# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=BiocBaseUtils
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="General utility functions for developing Bioconductor packages"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4122b1daf137814e176b7e4a2b46516f')
b2sums=('500f987f42d1bc818c7e7607b1d4fb0f30d67d63d478fca45b7118a118834661a03859f4e5344d96476cccc63749e0047cf4b6f17ca3f42af4298b42a5fbeb6b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
