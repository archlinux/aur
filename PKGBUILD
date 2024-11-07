# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EpiMix.data
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data for the EpiMix package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-experimenthub
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('64dd6bc27966ef5920f06823dcc4af94')
b2sums=('e6fbc628574b6e1c64fddd359ff36bcfce6f6dcb081c64495d66943b671223e9af2b046ac0ade85f68fc6ad0b8bcc33ccd131c1379fabb1c4db837a756316952')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
