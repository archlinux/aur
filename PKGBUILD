# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=msdata
_pkgver=0.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Various Mass Spectrometry raw data example files"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL)
depends=(
  r
)
optdepends=(
  r-msnbase
  r-mzr
  r-xcms
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ef7fea0866799a767fb8ac2d1da0a16')
sha256sums=('f9bb1dc20327d800807abe991ccf9b3b45a39f0b1e4cc039f21bb4f9b1fca1ca')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
