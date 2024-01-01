# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BenfordTests
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical Tests for Evaluating Conformity to Benford's Law"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL3)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8a93a90942af387ab4951c7d6c74892e')
b2sums=('c073223d68ccafd14680675211009f05df3002ee6437390a6bf6b04f4e6e7e77fc2f08161fc49b7f3aab906d5391673b69f131868b538739d6e541005348f61c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
