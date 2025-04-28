# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=JASPAR2024
_pkgver=0.99.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data package for JASPAR database (version 2024)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biocfilecache
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-rsqlite
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('997e71780374651c850909f338a3bcc2')
b2sums=('7af5ae3d86c3f84834aa03078205d5c637c74da1c954b5374caa8d6437275ca18b55b0563f1ff68da09958bbfd65a81c71dbfc2e416cb0ec0ece4703c0b37fc5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
