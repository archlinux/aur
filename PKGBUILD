# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MiChip
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="MiChip Parsing and Summarizing Functions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('09f2965c11d4f5c8c6ab63902d921e91')
b2sums=('78d22bd8d398ff85dc46dc606d73f1b42a48c8be74bca0f97eddd6cb6aecafd7978e969aa4f9ac6d17f61e2f4527fe83c6248910cad356402ca2c204dba70ee7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
