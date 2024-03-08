# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=qcc
_pkgver=2.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Quality Control Charts"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e16783e0accb474c542a0b3d07352431')
b2sums=('34564db3c476230fdf58ba3364b82ede7a143b51a1fdd3dd57ffd69d9a28225efdf0cbd3e620d6d8b6db5e1b0c659316148b97a280f8c4683ede1b21709bb5d2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
