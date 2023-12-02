# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=poLCA
_pkgver=1.6.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Polytomous Variable Latent Class Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-scatterplot3d
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1880d580c0b060ac7708458440462726')
sha256sums=('ed8c60a42bff0402c9ba2f9ce1422dd171e711c1a64498c4d96010ddb29f6b16')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
