# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=coxme
_pkgver=2.2-22
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=2
pkgdesc='Mixed Effects Cox Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL-2.0-only')
depends=(
  r-bdsmatrix
)
optdepends=(
  r-kinship2
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5d15e1df770ebabca1323d6a1a989d78')
b2sums=('14eb3202131ffdbe56c80a1d2af809a0beb4b5932402fa9476396c4d06bf576120ab9d8c9b578c7a8779631a3705ca8484bedbc89f74f29fe0c7082e26207afc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
