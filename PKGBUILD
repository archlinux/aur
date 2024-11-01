# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tximportData
_pkgver=1.34.0
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
md5sums=('fc6bbc67c32e7eac6e11b68af9343745')
b2sums=('cf2803011a8d77e9031c734e15c0b1794271d00bfeb29598abe649aa209d03c77c3113d7c72ae36435e8a5d2b9cec4126572685f6f03a6ea5e567c980cf8021e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
