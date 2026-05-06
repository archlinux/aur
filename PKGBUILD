# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=msdata
_pkgver=0.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Various Mass Spectrometry raw data example files"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-msnbase
  r-mzr
  r-xcms
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('32cc317463f31017d14aaf724cfe1130')
b2sums=('c77e8149766da406157451957e544fe87cd840fc54d5ca6fb4a79ed96ed071426904732b7b2943af973888a62ba97cca299bfacbf1e9a225fabbaab09b4e993a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
