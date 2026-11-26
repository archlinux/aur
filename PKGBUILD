# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=Rigraphlib
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="igraph library as an R package"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
makedepends=(
  cmake
  r-biocmake
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2809d75a3caae5d0637cac5e0383f016')
b2sums=('aa9d0c8cc598a8bdcd7fba858f994cfd4cbca6e0afc9bf6df70a96114588f6e75f4785d493cdb5eea738d6ed66f977de7a3b97c60354cf018b6c713133fd67a7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
