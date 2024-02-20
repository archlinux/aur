# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GENLIB
_pkgver=1.1.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genealogical Data Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
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
md5sums=('92679de1dd67a40d2dd704b886d5c779')
b2sums=('90e8be47dd0187096fcf39ade2fb59f9143fb48a881bffb816e81609ab40ba65cd2b5c842953479545005582c87b04bfba7d62f5ae0c2d0dfcac7c57bf2fdc28')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
