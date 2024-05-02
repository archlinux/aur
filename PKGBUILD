# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MOFAdata
_pkgver=1.19.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data package for Multi-Omics Factor Analysis (MOFA)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-multiassayexperiment
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6bd93186d8b9bcd858ac397ce322b206')
b2sums=('f71b6c61089fcdc6df578b2a471b9352f1d0726a8143ea60de6151a15b0f4f8c0b709ff20c4136b9075fc6de08d9c96de5a5903828d3a14c70c0819ef917ac7f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
