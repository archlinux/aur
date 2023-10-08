# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=restfulSEData
_pkgver=1.22.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Example metadata for the \"restfulSE\" R package"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-delayedarray
  r-experimenthub
  r-hdf5array
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rhdf5client
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e92deb8a55a329887e87c9d4520e4b9e')
sha256sums=('feea275178c368f2b32726ecdc96d2ac053aaaaa0211d278d4dd73cdc2a34d34')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
