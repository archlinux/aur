# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=lbfgs
_pkgver=1.2.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Limited-memory BFGS Optimization"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('312c98ccb82f84b5a8e3ee662a866b36')
b2sums=('9e6cbf5f1fe4870ba9a53eb7c90672e936d8d6e9ba098695d300b2ec6b64aaaf5a8fb41de3e28e48a98c62d0a4af652a5caa21e36bdd3e6280b5b2c5d0ff1172')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
