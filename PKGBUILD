# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MultimodalExperiment
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrative Bulk and Single-Cell Experiment Container"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-iranges
  r-multiassayexperiment
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0378943078aafcc9e43a1f9322b2ec3d')
b2sums=('762f8628973aea2c2ebd67c7bb9db4e2446b1799fecbcc39dab812763814f1a253f650a0a2c4ec89a430feaca546f908e41d99f43e77f087d8fba48bfb6c262f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
