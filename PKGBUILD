# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EpiMix.data
_pkgver=1.6.0
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
md5sums=('fbfb2e24d2bcaa86bc619408afdd46b4')
b2sums=('e8c03a9f38860a2ad2e88e143ebbf757db712846c9fab517bd77f5ec3c3e310d4f53cb958ce8149809a904643b48b9dff09dc7f18e82ab8c14a77d2920ad742e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
