# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RBioinf
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RBioinf"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-graph
)
optdepends=(
  r-rgraphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('303fc235421e997fcfcaa5f4615bc90e')
b2sums=('f7d4b7eaa00dbd58e12e8bcef543fca33cb7ef1d78599bea7acbdfadc6cabbcddbf88c2dd0977ff0d6d13a9ca5d2bd962104508d76072d6344d38bcc805df416')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
