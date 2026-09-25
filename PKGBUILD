# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=oompaData
_pkgver=3.1.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data to Illustrate OOMPA Algorithms"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0d5bbfb06b9e5f6190de6092c1eab78c')
b2sums=('d0ec4e12f0c24d7e5a57fc28be878ccf63dee118fe0d8b605643aaa5017ff50707aa6c80024c48c8a449c1c14b0966ac7377d4871cc503eb9ecbc690d6c145fc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
