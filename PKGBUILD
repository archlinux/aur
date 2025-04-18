# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=msdata
_pkgver=0.48.0
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
md5sums=('ab0242b8a187e6823f428e4fe4933f69')
b2sums=('35062654af9f337a88468aca162230b5121545a4af401236c1d4243ca3f9f29f9dc94fea17e8d11542b5f01d997b627d470277c844cbb641928df87e1f51135c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
