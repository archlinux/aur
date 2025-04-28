# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rawrr
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('d97165b34d51a1c4133314bead7055cb')
b2sums=('e3c6ca3089423adda1a5cc832fe8c25e700b12701bbbf938b41e94790eb03159cde7a3d08bb7616dc4faf375febcd08a80bf70c14f141f389a80c78cf5c9b18a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
