# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=S4Arrays
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Foundation of array-like containers in Bioconductor"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-abind
  r-biocgenerics
  r-iranges
  r-s4vectors
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-delayedarray
  r-knitr
  r-rmarkdown
  r-sparsearray
  r-testthat
  r-hdf5array
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9c5ea5de6d599b2d0e10657d95f84211')
b2sums=('db873fc949a00dc9ec95f907c0eeee7974774a5fcf44d64f6d2e522d30f49ccc3d621d84b12cdd9d7afbc8e8944758455a93ae404db37a26563f3e395da49e69')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
