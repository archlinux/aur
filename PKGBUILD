# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=S4Arrays
_pkgver=1.8.1
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
  r-crayon
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
md5sums=('f8044ce103449bbd67d1764d3e8d17ad')
b2sums=('6903f0664ad654328658c3dd81a057686d5f9da07a56490f2d73f1d010f51169b55126517cfd1d332ed2e18e2ee9050cc55de8f26d59a3a92a2c24109e980d75')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
