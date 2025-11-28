# system requirements: GNU make
# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=h5mread
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="A fast HDF5 reader"
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-iranges
  r-rhdf5
  r-rhdf5filters
  r-s4arrays
  r-s4vectors
  r-sparsearray
)
makedepends=(
  make
  r-rhdf5lib
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-experimenthub
  r-hdf5array
  r-knitr
  r-rmarkdown
  r-tenxbraindata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('86720227abade6529006673b161ab486')
b2sums=('632a9786e6bebbf0267c07e99b2eae5037d30c986183b4359b441e924e9441404318efb78cd4eb0b382e36855c2692abaea9758136b4b483feea7127c39888c7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
