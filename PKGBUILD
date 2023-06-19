# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=speedglm
_pkgver=0.3-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=2
pkgdesc="Fitting Linear and Generalized Linear Models to Large Data Sets"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-biglm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('48a7f9d2722b0142fc0372a6d8769acf')
sha256sums=('f8663677c10ff324c5639402060ddd2b1a1e917445cb0f8f84e146b85e82bb4b')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
