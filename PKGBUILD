# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tximportData
_pkgver=1.38.0
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
md5sums=('f7006aaacb3c9f61eda3d8ae1b4fc531')
b2sums=('d6aea26da10297120c8a3b06df5bcb41eb8b311234963b59fa5343accc5bb0adec1197ef5493644938a681a2eedd22e24fb797a91d46afea33943c45d0e758bb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
