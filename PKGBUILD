# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tximportData
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="provides the output of running various transcript abundance quantifiers on a set of 6 RNA-seq samples from the GEUVADIS project"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-markdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8043d6f2d8d6cf1777ddfee6ec3228ca')
b2sums=('d25cca55e91ca3ac16c703b158c64034d83ac121abded157d4e121caf750bcab4dbc7bf718a676b1cb94f11443d62f8a2a869744a63b361598eadbfc7b04800d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
