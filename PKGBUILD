# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rBeta2009
_pkgver=1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="The Beta Random Number and Dirichlet Random Vector Generating Functions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('38000662ab8b2318b24447ca0bfa984b')
b2sums=('d5858245bcbda9eb9b12d789922282db025c559159fa83d03f21927fb3d664b685abc4e5c4b571eaf9d6f806a5f0c3e883a6b46671efb453030af7efd4d21562')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
