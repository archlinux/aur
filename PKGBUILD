# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R2WinBUGS
_pkgver=2.1-22.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Running 'WinBUGS' and 'OpenBUGS' from 'R' / 'S-PLUS'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-coda
)
optdepends=(
  r-brugs
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fed637512e1fa184fab761080cda95f9')
b2sums=('a8f54b65b4d1b8216dc5a085b5dfc9c7bdc30eb0b2d684344ea7fc4ea6df9754d56af7bf06d44ec47d22e4e0e0721dec349c920949a2ebe3bdc0f0e9fa49c670')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
