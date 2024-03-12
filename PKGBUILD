# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rawrr
_pkgver=1.10.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Direct Access to Orbitrap Data and Beyond"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  mono
  r
)
optdepends=(
  r-biocstyle
  r-experimenthub
  r-knitr
  r-protviz
  r-rmarkdown
  r-tartare
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('42213a8a733115af719162fc1a72d6a1')
b2sums=('b5a4b1cdc4eac1454320b9c4345c0db0c9f1bf0ca0a5dcffc44c726011f723915cffaedbf3dfbcd0bb4b4d44ae1a1528f1f5a5e7ce6cd5c4c36b849dc255a70d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
