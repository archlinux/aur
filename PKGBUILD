# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GENLIB
_pkgver=1.1.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Genealogical Data Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-bootstrap
  r-doparallel
  r-foreach
  r-kinship2
  r-quadprog
  r-rcpp
)
makedepends=(
  r-bh
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e3eaea81d1ef60d4e3e48a45007d4d29')
sha256sums=('eed03324362afbe81138144342256ea036f8201cb1ec923d9bc63f508221b09b')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
