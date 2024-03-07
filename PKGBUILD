# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HiddenMarkov
_pkgver=1.8-13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Hidden Markov Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6ee706a6f6a95ef1fab017ff9d1c7f3b')
b2sums=('cd01a6140a5e7ca4edf40e54cae3748a7c3032c460e546295d522796d544ceef958ed445a5fcf7eea0aaef07ebaeec065e4dbe8865d5c5c780f7ed9e9915f547')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
